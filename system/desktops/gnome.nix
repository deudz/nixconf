{ pkgs, lib, ... }:

{
  services.xserver = {
    desktopManager.gnome.enable = true;
    displayManager.gdm.enable = true;
  };

  environment.etc = {
    "xdg/monitors.xml".text = ''
      <monitors version="2">
	<configuration>
	  <layoutmode>physical</layoutmode>
	  <logicalmonitor>
	    <x>0</x>
	    <y>0</y>
	    <scale>1</scale>
	    <primary>yes</primary>
	    <monitor>
	      <monitorspec>
                <connector>HDMI-1</connector>
	        <vendor>PHO</vendor>
	        <product>PMG24M23T</product>
	        <serial>000000000000</serial>
	      </monitorspec>
	        <mode>
	          <width>1920</width>
	          <height>1080</height>
	          <rate>179.998</rate>
	        </mode>
	    </monitor>
	  </logicalmonitor>
        </configuration>
        <configuration>
          <layoutmode>physical</layoutmode>
          <logicalmonitor>
          <x>0</x>
          <y>0</y>
          <scale>1</scale>
          <primary>yes</primary>
          <monitor>
            <monitorspec>
              <connector>DP-3</connector>
              <vendor>PHO</vendor>
              <product>PMG24M23T</product>
              <serial>000000000000</serial>
            </monitorspec>
            <mode>
              <width>1920</width>
              <height>1080</height>
              <rate>179.998</rate>
            </mode>
          </monitor>
          </logicalmonitor>
        </configuration>
      </monitors>
    '';
  };

  environment.systemPackages = with pkgs; [
    gnome-themes-extra
    showtime
    decibels
    
    gnomeExtensions.arcmenu
    gnomeExtensions.dash-to-panel
    gnomeExtensions.user-themes
    gnomeExtensions.appindicator
    gnomeExtensions.clipboard-indicator
    gnomeExtensions.blur-my-shell
    gnomeExtensions.just-perfection
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
