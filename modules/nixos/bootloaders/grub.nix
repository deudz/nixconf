{ ... }:

{
  boot.loader.timeout = 1;
  boot.loader.grub = {
    enable = true;
    timeoutStyle = "hidden";
  };
}
