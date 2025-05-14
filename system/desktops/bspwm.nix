{ pkgs, ... }:
{
  services.xserver= {
    enable = true;
    displayManager.lightdm.enable = true;
    windowManager.bspwm.enable = true;
  };

  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal ];
    configPackages = [ pkgs.xdg-desktop-portal ];
  };

  environment.systemPackages = with pkgs; [
    picom
    polybar
    rofi
    sxhkd
    feh
    mpv
    xfce.thunar
  ];
}
