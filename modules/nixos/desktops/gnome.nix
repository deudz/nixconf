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
    
    gnomeExtensions.appindicator
    gnomeExtensions.vertical-workspaces
    gnomeExtensions.gtk4-desktop-icons-ng-ding
    gnomeExtensions.clipboard-indicator
  ];

  environment.gnome.excludePackages = with pkgs; [
    totem
    snapshot
    geary
    gnome-tour
    epiphany
    simple-scan
    gnome-music
    gnome-connections
    gnome-maps
    gnome-weather
    gnome-logs
    gnome-contacts
    orca
    yelp
  ];

  programs.gnupg.agent.pinentryPackage = pkgs.pinentry-gnome3;
}
