{ pkgs, inputs, ... }:
{
  imports = [
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

  home.shellAliases = {
    ytbest = "yt-dlp -f bv+ba";
    ytwav = "yt-dlp -x --audio-format wav";
    ytmp3 = "yt-dlp -x --audio-format mp3";
  };

  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
  };

  programs.starship = {
    enable = true;
    settings = {
      add_newline = false;
      line_break.disabled = true;
      username = {
        show_always = true;
        format = "[$user]($style)";
        style_user = "bold yellow";
      };
      hostname = {
        ssh_only = false;
        format = "[$hostname]($style)";
        style = "bold cyan";
      };
      directory = {
        format = "[$path]($style)[$read_only]($read_only_style)";
        style = "bold purple";
        home_symbol = "~/";
        truncation_symbol = ".../";
        read_only = "\\[RO\\]";
      };
      character = {
        success_symbol = "[\\$](bold green)";
        error_symbol = "[\\$](bold red)";
      };
      format = "[<](bold red)$username[@](bold green)$hostname $directory[>](bold red) $all$character";
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
