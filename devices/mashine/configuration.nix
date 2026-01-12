{ config, lib, pkgs, inputs, ... }:
{
  imports =
    [
      ./hardware-configuration.nix

      ../../system/bootloaders/limine.nix
      ../../system/desktops/plasma6.nix
      ../../system/users/deudz.nix
      ../../system/network.nix
      ../../system/bluetooth.nix
      ../../system/pipewire.nix
      ../../system/steam.nix
      ../../system/zram.nix
      ../../system/flatpak.nix
#      ../../system/virt-manager.nix
      ../../system/gpg.nix
      ../../system/ssh.nix
      ../../system/wacom.nix
      ../../system/distrobox.nix
      ../../system/nix-helper.nix
      ../../system/fonts.nix

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
  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocales = [ "pt_BR.UTF-8/UTF-8" ];
  };

  networking.hostName = "mashine";

  systemd.tmpfiles.rules = [
    "L+    /opt/rocm/hip   -    -    -     -    ${pkgs.rocmPackages.clr}"
  ];
  hardware.graphics.extraPackages = [
    pkgs.rocmPackages.clr.icd
  ];
  environment.variables.ROC_ENABLE_PRE_VEGA = "1";

  system.stateVersion = "24.11";
}
