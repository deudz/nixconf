{ pkgs, inputs, ... }:
{
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
    gimp
    prismlauncher
    ardour
    audacity
    ffmpeg
    deadbeef
    gpu-screen-recorder-gtk
    libreoffice

    inputs.zen-browser.packages.x86_64-linux.default
  ];
}
