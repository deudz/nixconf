{ pkgs, ... }:
{
  programs.emacs = {
    enable = true;
    package = pkgs.emacs-gtk;
  };

  services.emacs = {
    enable = true;
    defaultEditor = true;
  };
}
