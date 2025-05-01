{ pkgs, inputs, ... }:
{
  home.packages = with pkgs; [
    alacritty
    blender
    obsidian
    keepassxc
    yt-dlp
    furnace
    spotify
    vesktop
    pinentry-tty
    krita
    gimp
    prismlauncher
    ardour
    audacity
    ffmpeg
    deadbeef
    gpu-screen-recorder-gtk
    libreoffice
    git
    tmux
    godot
    libresprite

    inputs.zen-browser.packages.x86_64-linux.default
  ];
}
