{ ... }:
{
  users.extraGroups.docker.members = [ "deudz" ];
  virtualisation.docker = {
    enable = true;
    storageDriver = "btrfs";
  };
}
