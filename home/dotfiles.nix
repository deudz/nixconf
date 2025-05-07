{ config, ... }:
let
  dotfilesDir = "/nix/dotfiles/";
  mkSymlink = location:
    config.lib.file.mkOutOfStoreSymlink
      (builtins.toPath (config.home.homeDirectory + dotfilesDir + location));
in
{
  # emacs
  # xdg.configFile."emacs/init.el".source = mkSymlink emacs/init.el;
  # xdg.configFile."emacs/early-init.el".source = mkSymlink emacs/early-init.el;

  # zsh
  home.file.".zshrc".source = mkSymlink "zshrc";

  # gitconfig
  home.file.".gitconfig".source = mkSymlink "gitconfig";
}
