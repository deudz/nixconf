{ pkgs, inputs, ... }:
let
    myncmpcpp = pkgs.ncmpcpp.override { visualizerSupport = true; };
in
{
  home.packages = with pkgs; [
    alacritty
    blender
    obsidian
    keepassxc
    yt-dlp
    furnace
    vesktop
    pinentry-tty
    krita
    gimp
    prismlauncher
    ardour
    audacity
    ffmpeg
    myncmpcpp
    mpd
    gpu-screen-recorder-gtk
    libreoffice
    git
    tmux
    godot
    libresprite

    inputs.zen-browser.packages.x86_64-linux.default
  ];
}
