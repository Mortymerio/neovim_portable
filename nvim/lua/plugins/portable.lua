return {
  -- Configure Treesitter to use our portable Zig compiler
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      local nvim_root = vim.env.NVIM_ROOT
      if nvim_root then
        -- Add zig to the PATH for compilation
        local path_sep = ":"
        if vim.loop.os_uname().version:find("Windows") then
          path_sep = ";"
        end
        vim.env.PATH = nvim_root .. "/tools/zig" .. path_sep .. vim.env.PATH
        
        -- Configure treesitter to use the local compiler
        require("nvim-treesitter.install").compilers = { "zig", "gcc", "clang" }
      end
    end,
  },
}
