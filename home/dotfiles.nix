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

  # alacritty
  xdg.configFile."alacritty/alacritty.toml".source = mkSymlink "alacritty/alacritty.toml";

  # bspwm
  xdg.configFile."bspwm/bspwmrc".source = mkSymlink "bspwm/bspwmrc";
  xdg.configFile."bspwm/wallpaper.png".source = mkSymlink "bspwm/wallpaper.png";

  # sxhkd
  xdg.configFile."sxhkd/sxhkdrc".source = mkSymlink "sxhkd/sxhkdrc";

  # picom
  xdg.configFile."picom/picom.conf".source = mkSymlink "picom/picom.conf";

  # rofi
  xdg.configFile."rofi/config.rasi".source = mkSymlink "rofi/config.rasi";
  xdg.configFile."rofi/bismuth.rasinc".source = mkSymlink "rofi/bismuth.rasinc";
}
