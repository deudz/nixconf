{ config, lib, pkgs, ... }:
{
  imports =
    [
      ./hardware-configuration.nix

      ../../system/bootloaders/grub.nix
      ../../system/desktops/bspwm.nix
      ../../system/pipewire.nix
      ../../system/steam.nix
      ../../system/zram.nix
      ../../system/flatpak.nix
      ../../system/virt-manager.nix
      ../../system/gpg.nix
      ../../system/ssh.nix
      ../../system/wacom.nix
      ../../system/distrobox.nix
      ../../system/nix-helper.nix

      ../../system/shells/zsh.nix
    ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowUnfree = true;

  boot.kernelParams = [ "intel_iommu=on" "iommu=pt" ];
  boot.loader.grub.efiSupport = true;
  boot.loader.grub.device = "nodev";
  boot.loader.efi.canTouchEfiVariables = true;

  time.timeZone = "America/Sao_Paulo";
  i18n.defaultLocale = "pt_BR.UTF-8";

  networking = {
    hostName = "mashine";
    useDHCP = false;
    networkmanager.enable = true;
    networkmanager.dns = "none";
    nameservers = [ "1.1.1.1" "1.0.0.1" ];
  };  

  users.users.deudz = {
    shell = pkgs.zsh;
    initialPassword = "123";
    isNormalUser = true;
    extraGroups = [ "wheel" "libvirtd" "kvm" "render" "audio" ];
  };

  system.stateVersion = "24.11";
}

