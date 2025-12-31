{ pkgs, ... }:
{
  home.packages = [
    pkgs.direnv
  ];
  services.lorri.enable = true;
}
