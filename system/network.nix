{ ... }:
let
  # 0 == networkmanager
  # 1 == networkd
  type = 0;
  dns = [ "1.1.1.1" "1.0.0.1" ];
in
if type == 0 then
{
  networking = {
    networkmanager.enable = true;
    networkmanager.insertNameservers = dns;
  };
}
else if type == 1 then
{
  networking = {
    dhcpcd.enable = false;
    useNetworkd = true;
    useDHCP = true;
    nameservers = dns;
  };

  systemd.network = {
    enable = true;
  };
}
else builtins.abort "INVALID NETWORKING TYPE"
