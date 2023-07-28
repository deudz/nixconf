{ pkgs, ... }:
{
  home.packages = with pkgs; [
    zandronum
  ];

  programs.steam = {
    enable = true;
  };
}
