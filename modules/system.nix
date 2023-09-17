{ inputs, config, pkgs, ... }:
{
  imports = 
    [ 
      ./hardware.nix
      inputs.home-manager.nixosModules.home-manager
    ];

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users.dan = import ./home.nix;
  };

  programs.zsh.enable = true;
  users.users.dan.shell = pkgs.zsh;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  boot.loader.grub = {
    enable = true;
    device = "/dev/sda";
    useOSProber = true;
  };

  zramSwap.enable = true;

  systemd.network.enable = true;
  networking = {
    dhcpcd.enable = false;
    hostName = "calculator";
    networkmanager.enable = true;
    wireless.enable = false;
  };

  time.timeZone = "America/Sao_Paulo";

  i18n.defaultLocale = "pt_BR.UTF-8";

  console.keyMap = "br-abnt2";

  services.xserver = {
    enable = true;
    displayManager.sddm.enable = true;
    desktopManager.plasma5.enable = true;

    excludePackages = with pkgs; [ xterm ];

    layout = "br";
    xkbVariant = "abnt2";

    wacom.enable = true;
  };

  hardware.bluetooth.enable = true;

  sound.enable = true;
  services.pipewire = {
    enable = true;
    pulse.enable = true;
    alsa.enable = true;
    jack.enable = true;
  };

  users.users.dan = {
    isNormalUser = true;
    description = "Dan";
    extraGroups =
      [
        "networkmanager"
	"wheel"
	"cdrom"
	"kvm"
	"disk"
	"audio"
	"input"
      ];
    };

  nixpkgs.config.allowUnfree = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05"; # !Read the comment before changing! #
}
