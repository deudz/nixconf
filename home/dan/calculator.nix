{ pkgs, ... }:
{
  imports = 
    [
      ../../pkgs/emacs.nix
      ../../pkgs/discord.nix
    ];

  home.username = "dan";
  home.homeDirectory = "/home/dan";

  home.stateVersion = "23.05";
}
