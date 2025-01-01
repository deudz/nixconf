{ config, lib, pkgs, ... }:
{
  imports =
    [
      ./hardware-configuration.nix
      ../../modules/nixos/bootloaders/grub.nix
      ../../modules/nixos/desktops/plasma6.nix
      ../../modules/nixos/pipewire.nix

      ../../modules/nixos/shells/zsh.nix
    ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowUnfree = true;

  boot.loader.grub.efiSupport = true;
  boot.loader.grub.device = "nodev";
  boot.loader.efi.canTouchEfiVariables = true;

  time.timeZone = "America/Sao_Paulo";

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
    extraGroups = [ "wheel" "docker" ];
  };

  system.stateVersion = "24.11";
}

