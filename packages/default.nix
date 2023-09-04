{ pkgs, ... }:
{
  imports =
    [
      ./git.nix
      ./emacs.nix
      ./gaming.nix
    ];

  home.packages = with pkgs;
    [
      logseq
      firefox
      thunderbird
      kdenlive
      vlc
    ];
}
