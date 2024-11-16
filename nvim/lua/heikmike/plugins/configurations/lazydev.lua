local lazydev = require('lazydev')

lazydev.setup({
  library = {
    { path = 'luvit-meta/library', words = { 'vim%.uv' } },
    { plugins = 'nvim-dap-ui', types = true },
  }
})
