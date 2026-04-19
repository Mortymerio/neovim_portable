return {
  -- Configure Treesitter to handle portable paths and space issues on Windows
  {
    "nvim-treesitter/nvim-treesitter",
    init = function()
      local nvim_root = vim.env.NVIM_ROOT
      if nvim_root then
        -- 1. Create a dedicated portable directory for parsers
        local parser_dir = nvim_root .. "/nvim-data/parsers"
        if vim.fn.isdirectory(parser_dir) == 0 then
          vim.fn.mkdir(parser_dir, "p")
        end
        
        -- 2. Add it to runtimepath so Neovim can find the compiled .so files
        vim.opt.runtimepath:prepend(parser_dir)
        
        -- 3. Prepend zig to path for the compiler to find it
        local path_sep = ";"
        vim.env.PATH = nvim_root .. "\\tools\\zig" .. path_sep .. vim.env.PATH
      end
    end,
    opts = function(_, opts)
      local nvim_root = vim.env.NVIM_ROOT
      if nvim_root then
        local parser_dir = nvim_root .. "/nvim-data/parsers"
        
        -- Configure the install directory
        require("nvim-treesitter.install").compilers = { "gcc", "zig", "clang" }
        require("nvim-treesitter.install").prefer_git = true
        
        opts.parser_install_dir = parser_dir
      end
      return opts
    end,
  },
}
