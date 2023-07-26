{ pkgs, ... }:
{
  home.packages = with pkgs; [
    gnome.gnome-terminal
    evolution
    mpv
  ];
}