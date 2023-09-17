{ pkgs, ... }:
{
  nixpkgs.config.allowUnfree = true;  

  imports =
    [
      ./nixvim.nix
      ./git.nix
      ./zsh.nix
    ];

  home.packages = with pkgs;
    [
      logseq
      firefox
      thunderbird
      kdenlive
      vlc
      qemu
      (pkgs.discord.override {
        withOpenASAR = true;
      })
    ];
}
