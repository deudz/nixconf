{ pkgs, ... }:
{
  services = {
    displayManager.ly.enable = true;
    xserver.windowManager.bspwm.enable = true;
  };

  xdg.portal = {
    enable = true;
    configPackages = [ pkgs.xdg-desktop-portal ];
  };

  environment.systemPackages = with pkgs; [
    picom
    polybar
    rofi
  ];
}
