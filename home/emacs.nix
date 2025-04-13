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
  home.packages = [
    myEmacs
  ];

  services.emacs = {
    enable = true;
    package = myEmacs;
    defaultEditor = true;
  };
}
