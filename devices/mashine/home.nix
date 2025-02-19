{ pkgs, inputs, ... }:

{
  imports = [
    ../../modules/home-manager/programs/emacs.nix
    ../../modules/home-manager/programs/vscode.nix
    ../../modules/home-manager/programs/tmux.nix
    ../../modules/home-manager/programs/git.nix
  ];

  home.username = "deudz";
  home.homeDirectory = "/home/deudz";

  home.stateVersion = "24.05";

  home.packages = with pkgs; [
    blender
    obsidian
    keepassxc
    yt-dlp
    furnace
    spotify
    vesktop
    pinentry-tty
    krita
    prismlauncher
    ardour
    lollypop
    gpu-screen-recorder-gtk

    inputs.zen-browser.packages.x86_64-linux.default
  ];

  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
  };

  programs.starship = {
    enable = true;
    settings = {
      
    };
  };

  programs.git = {
    userName = "Danilo Soares";
    userEmail = "deudzdev@gmail.com";
    extraConfig = {
      user = {
        signingKey = "42B95F7C4FC2CA13FD4E86B6F0D8B7CE0B7EC148";
      };
      init = {
        defaultBranch = "main";
      };
      gpg = {
        format = "openpgp";
      };
      commit = {
        gpgSign = true;
      };
    };
  };

  programs.home-manager.enable = true;
}
