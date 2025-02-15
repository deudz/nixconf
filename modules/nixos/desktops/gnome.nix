{ pkgs, ... }:

{
  services.xserver = {
    desktopManager.gnome.enable = true;
    displayManager.gdm.enable = true;
  };

  environment.systemPackages = with pkgs; [
    showtime
    decibels
    gnome-sound-recorder
  ];

  environment.gnome.excludePackages = with pkgs; [
    totem
    snapshot
    geary
    gnome-tour
    epiphany
    simple-scan
    gnome-music
  ];

  programs.gnupg.agent.pinentryPackage = pkgs.pinentry-gnome3;
}
