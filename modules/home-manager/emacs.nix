{ pkgs, config, ... }:
let
  mkSymlink = location: config.lib.file.mkOutOfStoreSymlink location;
  myEmacs = with pkgs; (emacsPackagesFor emacs-gtk).emacsWithPackages (
    epkgs: [
      epkgs.treesit-grammars.with-all-grammars
      epkgs.tree-sitter-langs
    ]);
in
{
  xdg.configFile."emacs/init.el".source = mkSymlink /home/deudz/nix/dotfiles/emacs/init.el;

  programs.emacs = {
    enable = true;
    package = myEmacs;
  };

  services.emacs = {
    enable = true;
    package = myEmacs;
    defaultEditor = true;
  };
}
