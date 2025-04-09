{ pkgs, ... }:

{
  services = {
    displayManager.sddm.enable = true;
    desktopManager.plasma6.enable = true;
  };

  environment.systemPackages = with pkgs; [
    vlc
  ];

  programs.gnupg.agent.pinentryPackage = pkgs.pinentry-qt;
}
  
