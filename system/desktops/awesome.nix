{ pkgs, ... }:
{
  services.xserver= {
    enable = true;
    displayManager.lightdm.enable = true;
    windowManager.awesome.enable = true;
  };

  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal ];
    configPackages = [ pkgs.xdg-desktop-portal ];
  };

  environment.systemPackages = with pkgs; [
    picom
    rofi
    feh
    mpv
    xfce.thunar
  ];
}
