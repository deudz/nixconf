{ config, lib, pkgs, ... }:
{
  imports =
    [
      ./hardware-configuration.nix
      ../../modules/nixos/bootloaders/grub.nix
      ../../modules/nixos/desktops/gnome.nix
      ../../modules/nixos/pipewire.nix
      ../../modules/nixos/steam.nix
      ../../modules/nixos/zram.nix
      ../../modules/nixos/flatpak.nix
      ../../modules/nixos/virt-manager.nix
      ../../modules/nixos/gpg.nix
      ../../modules/nixos/ssh.nix
      ../../modules/nixos/wacom.nix
      ../../modules/nixos/distrobox.nix

      ../../modules/nixos/shells/zsh.nix
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
    isNormalUser = true;
    extraGroups = [ "wheel" "libvirtd" "kvm" "render" "audio" ];
  };

  system.stateVersion = "24.11";
}

