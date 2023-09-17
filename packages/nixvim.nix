{ inputs, ... }:
{
  imports = [ inputs.nixvim.homeManagerModules.nixvim ];

  programs.nixvim = {
    enable = true;
    colorschemes.gruvbox.enable = true;

    plugins = {
      # utilities 
      treesitter.enable = true;
      which-key.enable = true;
      telescope.enable = true;
      lualine.enable = true;
      nvim-tree.enable = true;
      
      # autocompletion
      lsp = {
        enable = true;
	enabledServers = 
	  [
            "html"
	    "cssls"
	    "tsserver"
	    "clangd"
	    "nixd"
          ];
      };
      luasnip.enable = true;
      nvim-autopairs.enable = true;
      
      # cmp stuff
      nvim-cmp.enable = true;
      cmp-nvim-lsp.enable = true;
      cmp-path.enable = true;
      cmp-cmdline.enable = true;
    };
  };
}
