{ pkgs, lib, ... }:

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

  environment.sessionVariables.GST_PLUGIN_SYSTEM_PATH_1_0 = lib.makeSearchPathOutput "lib" "lib/gstreamer-1.0" [
    pkgs.gst_all_1.gst-plugins-good
    pkgs.gst_all_1.gst-plugins-bad
    pkgs.gst_all_1.gst-plugins-ugly
    pkgs.gst_all_1.gst-libav
  ];

  programs.gnupg.agent.pinentryPackage = pkgs.pinentry-gnome3;
}
