{ config, ... }:
let
  mkSymlink = location: config.lib.file.mkOutOfStoreSymlink location;
in
{
  # emacs
  xdg.configFile."emacs/init.el".source = mkSymlink /home/deudz/nix/dotfiles/emacs/init.el;
  xdg.configFile."emacs/early-init.el".source = mkSymlink /home/deudz/nix/dotfiles/emacs/early-init.el;

  # zsh
  home.file.".zshrc".source = mkSymlink /home/deudz/nix/dotfiles/zshrc;

  # gitconfig
  home.file.".gitconfig".source = mkSymlink /home/deudz/nix/dotfiles/gitconfig;
}
