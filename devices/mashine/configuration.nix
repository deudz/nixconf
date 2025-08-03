{ config, lib, pkgs, inputs, ... }:
{
  imports =
    [
      ./hardware-configuration.nix

      ../../system/bootloaders/grub.nix
      ../../system/desktops/gnome.nix
      ../../system/network.nix
      ../../system/bluetooth.nix
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

  services.xserver.xkb = {
    layout = "br";
    model = "pc104";
    variant = "abnt2";
  };
  console.useXkbConfig = true;

  boot.kernelParams = [ "intel_iommu=on" "iommu=pt" "vfio-pci.ids=1002:6fdf,1002:aaf0" ];
  boot.loader.grub.efiSupport = true;
  boot.loader.grub.device = "nodev";
  boot.loader.efi.canTouchEfiVariables = true;

  boot.initrd.kernelModules = [
    "vfio_pci"
    "vfio"
    "vfio_iommu_type1"

    "amdgpu"
  ];

  time.timeZone = "America/Sao_Paulo";
  i18n.defaultLocale = "pt_BR.UTF-8";

  networking.hostName = "mashine";

  users.users.deudz = {
    shell = pkgs.zsh;
    initialPassword = "123";
    isNormalUser = true;
    extraGroups = [ "wheel" "libvirtd" "kvm" "render" "audio" ];
  };

  system.stateVersion = "24.11";
}

