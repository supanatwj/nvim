return {
  -- 1. แทรกการตั้งค่าเข้าไปใน Telescope ตัวหลัก
  {
    "nvim-telescope/telescope.nvim",
    version = "*",
    dependencies = {
        'nvim-lua/plenary.nvim',
        -- optional but recommended
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },
    opts = {
      extensions = {
        fzy_native = {
          override_generic_sorter = false,
          override_file_sorter = true,
        },
      },
    },
  },

  -- 2. ติดตั้งและโหลด Extension fzy-native
  {
    "nvim-telescope/telescope-fzy-native.nvim",
    config = function()
      require("telescope").load_extension("fzy_native")
    end,
  },
}
