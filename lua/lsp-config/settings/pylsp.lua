return {
  settings = {
    pylsp = {
      plugins = {
        pycodestyle = {
          ignore = {'W391', 'E401', 'E41', 'E226', 'E126'},
          maxLineLength = 100
        },
        ruff = {
            enabled = true,
            extendSelect = { "I" },
        }
      }
    }
  }
}
