{ pkgs, ... }:
{
  imports =
    [
      ./git.nix
      ./emacs.nix
    ];

  home.packages = with pkgs;
    [
      logseq
      firefox
      thunderbird
      kdenlive
      vlc
      qemu
    ];
}
