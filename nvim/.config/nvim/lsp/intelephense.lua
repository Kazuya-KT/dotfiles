return {
  cmd = { 'intelephense', '--stdio' },
  filetypes = { 'php' },
  -- composer.json を .git より優先する。
  -- モノレポ（例: MANABI/laravel）で Laravel ディレクトリを
  -- ルートにするため
  root_markers = { 'composer.json', '.git' },
  settings = {
    intelephense = {
      files = {
        -- デフォルトは 1MB。laravel-ide-helper の _ide_helper.php が
        -- 1MB を超えるとインデックスされず Facade の定義ジャンプが効かない
        maxSize = 5000000,
        exclude = {
          '**/.git/**',
          '**/node_modules/**',
          '**/vendor/**/{Tests,tests}/**',
          '**/storage/framework/**',
          '**/bootstrap/cache/**',
          '**/public/build/**',
        },
      },
      environment = {
        phpVersion = '8.2.0',
      },
    },
  },
}
