{ pkgs, ... }:
{
  users.users.deudz = {
    shell = pkgs.zsh;
    initialPassword = "123";
    isNormalUser = true;
    extraGroups = [ "wheel" "libvirtd" "kvm" "render" "audio" ];
  };
}
