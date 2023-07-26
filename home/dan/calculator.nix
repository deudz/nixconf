{ pkgs, ... }:
{
  imports = 
    [
      ../../pkgs/firefox.nix
      ../../pkgs/desktop.nix
      ../../pkgs/emacs.nix
      ../../pkgs/discord.nix
    ];

  home.username = "dan";
  home.homeDirectory = "/home/dan";

  home.stateVersion = "23.05";

  home.packages = [
    pkgs.git
  ];
}
