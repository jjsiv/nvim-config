return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  opts = {
    options = {
      theme = 'everforest',
      globalstatus = true,
    },
    sections = {
      lualine_c = {
        {
          'filename',
          path = 1,
          newfile_status = true,
        }
      }
    },
    tabline = {
      lualine_a = {
        {
          'buffers',
          show_filename_only = false,
          mode = 4,
          max_length = vim.o.columns
        }
      }
    }
  }
}
