{ ... }:
let
  # 0 == networkmanager
  # 1 == networkd
  type = 0;
in
if type == 0 then
{
  networking = {
    useDHCP = false;
    networkmanager.enable = true;
    networkmanager.dns = "none";
    nameservers = [ "1.1.1.1" "1.0.0.1" ];
  };
}
else if type == 1 then
{
  networking = {
    dhcpcd.enable = false;
    useNetworkd = true;
    useDHCP = true;
    nameservers = [ "1.1.1.1" "1.0.0.1" ];
  };

  systemd.network = {
    enable = true;
  };
}
else builtins.abort "INVALID NETWORKING TYPE"
