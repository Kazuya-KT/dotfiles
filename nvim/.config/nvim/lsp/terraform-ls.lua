-- terraform-ls 0.39.0 は semanticTokens の差分に負の値を uint32 で折り返して返す
-- (例: ses.tf で 4294967274)。Neovim 0.12 の semantic_tokens.lua はこれを
-- 42億文字のトークンとして扱い、数十億回ループして固まる。
-- 絶対位置に直して、壊れたトークンだけ捨ててから Neovim に渡す
local function sanitize(data)
  local out = {}
  local line, start = 0, 0
  local prev_line, prev_start = 0, 0
  for i = 1, #data, 5 do
    local delta_line, delta_start, length = data[i], data[i + 1], data[i + 2]
    if delta_start >= 0x80000000 then
      delta_start = delta_start - 0x100000000
    end
    line = line + delta_line
    start = delta_line == 0 and start + delta_start or delta_start
    if start >= 0 and length < 0x80000000 then
      table.insert(out, line - prev_line)
      table.insert(out, line == prev_line and start - prev_start or start)
      table.insert(out, length)
      table.insert(out, data[i + 3])
      table.insert(out, data[i + 4])
      prev_line, prev_start = line, start
    end
  end
  return out
end

return {
  cmd = { 'terraform-ls', 'serve' },
  filetypes = { 'terraform', 'terraform-vars' },
  root_markers = { '.terraform', '.git' },
  on_init = function(client)
    local request = client.request
    client.request = function(self, method, params, handler, bufnr)
      if method == 'textDocument/semanticTokens/full' and handler then
        local original = handler
        handler = function(err, result, ctx)
          if result and result.data then
            result.data = sanitize(result.data)
          end
          return original(err, result, ctx)
        end
      end
      return request(self, method, params, handler, bufnr)
    end
  end,
}
