{ pkgs, ... }:
{
  services.displayManager.ly.enable = true;
  programs.river = {
    enable = true;
  };

  environment.systemPackages = with pkgs; [
    waybar
    wofi
  ];
}
