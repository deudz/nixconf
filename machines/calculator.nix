{ config, pkgs, ... }:

{
  imports =
    [
      ../modules/calculator_hardware.nix
    ];

  # Bootloader
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";
  boot.loader.grub.useOSProber = true;

  networking.hostName = "calculator"; # Set hostname
  networking.wireless.enable = false;  # Disable wireless support

  ## Enable networking
  # networkmanager is pretty buggy for some reason so 
  # networking only works correctly with systemd's networkd
  networking.useNetworkd = true;

  # Set your time zone
  time.timeZone = "America/Sao_Paulo";

  # Select internationalisation properties
  i18n.defaultLocale = "pt_BR.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "pt_BR.UTF-8";
    LC_IDENTIFICATION = "pt_BR.UTF-8";
    LC_MEASUREMENT = "pt_BR.UTF-8";
    LC_MONETARY = "pt_BR.UTF-8";
    LC_NAME = "pt_BR.UTF-8";
    LC_NUMERIC = "pt_BR.UTF-8";
    LC_PAPER = "pt_BR.UTF-8";
    LC_TELEPHONE = "pt_BR.UTF-8";
    LC_TIME = "pt_BR.UTF-8";
  };

  # Enable the X11 windowing system
  services.xserver.enable = true;

  # Enable the Enlightenment Desktop Environment
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  # Enable acpid
  services.acpid.enable = true;

  # Enable bluetooth
  hardware.bluetooth.enable = true;

  # Configure keymap in X11
  services.xserver = {
    layout = "br";
    xkbVariant = "";
  };

  # Configure console keymap
  console.keyMap = "br-abnt2";

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  # Create a user account
  users.users.dan = {
    isNormalUser = true;
    description = "Dan";
    extraGroups = [ "networkmanager" "wheel" ];
  };

  environment.gnome.excludePackages = (with pkgs; [
    gnome-tour
    gnome-console
  ]) ++ (with pkgs.gnome; [
    cheese
    gnome-music
    epiphany
    geary
    gnome-characters
    gnome-weather
    gnome-calendar
    gnome-contacts
    gnome-maps
    simple-scan
    totem
    yelp
  ]);

  services.xserver.excludePackages = [ pkgs.xterm ];

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05"; # Did you read the comment?
}
