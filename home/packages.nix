{ pkgs, inputs, ... }:
#let
#    myncmpcpp = pkgs.ncmpcpp.override { visualizerSupport = true; };
#in
{
  home.packages = with pkgs; [
#    alacritty
    blender-hip
    obsidian
    keepassxc
    yt-dlp
    furnace
    vesktop
    pinentry-tty
    krita
    gimp
    prismlauncher
#    ardour
    audacity
    gamemode
    ffmpeg
#    myncmpcpp
    mpd
    gpu-screen-recorder-gtk
    git
    tmux
    godot
    libresprite
    zed-editor
    appimage-run
    freerdp
    docker-compose
    lutris-free
    schismtracker
    
    inputs.zen-browser.packages.${system}.default
  ];
}
