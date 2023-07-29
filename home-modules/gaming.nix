{ pkgs, ... }:
{
  home.packages = with pkgs; [
    zandronum
    doomseeker
    prismlauncher
  ];
}
