{ config, ... }:

{
  imports =
    [
      ../packages
    ];

  home.username = "dan";
  home.homeDirectory = "/home/dan";

  home.sessionVariables = {
    EDITOR = "emacs";
  };

  home.stateVersion = "23.05";
  programs.home-manager.enable = true;
}
