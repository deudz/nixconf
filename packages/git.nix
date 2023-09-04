{ ... }:
{
  programs.git = {
    enable = true;
    userName = "Danilo Soares";
    userEmail = "deudzdev@gmail.com";
    aliases = {
      ch = "checkout";
      st = "status";
      pu = "push";
      br = "branch";
      pl = "pull";
      cm = "commit";
    };
  };
}
