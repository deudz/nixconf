{ pkgs, ... }:

{
  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      rocmPackages_5.clr.icd
    ];
  };

  environment = {
    variables.ROC_ENABLE_PRE_VEGA = "1";
    systemPackages = [ pkgs.davinci-resolve ];
  };

  systemd.tmpfiles.rules = [
    "L+    /opt/rocm/hip   -    -    -     -    ${pkgs.rocmPackages_5.clr}"
  ];
}
