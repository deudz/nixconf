{ pkgs, config, ... }:
{
  home.packages = [
    pkgs.emacs
  ];

  services.emacs = {
    enable = true;
    package = pkgs.emacs;
    socketActivation.enable = true;
    startWithUserSession = "graphical";
  };
}
