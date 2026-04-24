return {
  cmd = { 'intelephense', '--stdio' },
  filetypes = { 'php' },
  root_markers = { '.git', 'composer.json' },
  settings = {
    intelephense = {
      environment = {
        phpVersion = '8.2.0',
      },
    },
  },
}
