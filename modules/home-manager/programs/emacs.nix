{ ... }:

{
  programs.emacs = {
    enable = true;
    extraConfig = ''
      (setq make-backup-files nil)
      (setq standard-indent 2)
    '';
  };

  services.emacs = {
    enable = true;
    defaultEditor = true;
  };
}
