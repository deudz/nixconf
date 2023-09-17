{ ... }:
{
  programs.zsh = {
    enable = true;
    shellAliases = {
      ll = "ls -l --group-directories-first --color=yes";
      la = "ls -lah --group-directories-first --color=yes";
      vim = "nvim";
      sw = "sudo nixos-rebuild switch --flake ~/git/nixconf#";
    };
  };
}
