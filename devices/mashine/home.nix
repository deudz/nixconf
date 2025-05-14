{ pkgs, inputs, ... }:
{
  imports = [
    ../../home/packages.nix
    ../../home/dotfiles.nix

    ../../home/spicetify.nix
    ../../home/emacs.nix
    ../../home/vscode.nix
  ];

  home.username = "deudz";
  home.homeDirectory = "/home/deudz";

  home.stateVersion = "24.05";

  programs.home-manager.enable = true;
}
