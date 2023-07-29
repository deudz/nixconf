{ pkgs, ... }:
{
  imports = 
    [
      ../home-modules
    ];

  home.username = "dan";
  home.homeDirectory = "/home/dan";

  home.stateVersion = "23.05";

  home.packages = [
    pkgs.git
  ];
}
