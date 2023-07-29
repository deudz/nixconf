{ pkgs, ... }:
{
  home.packages = with pkgs; [
    zandronum
    prismlauncher
  ];
}
