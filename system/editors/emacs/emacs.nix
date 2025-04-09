{ inputs, pkgs, ... }:
{
  nixpkgs.overlays = [
    (import inputs.emacs-overlay)
  ];

  services.emacs = {
    enable = true;
    startWithGraphical = true;
    defaultEditor = true;
    package = (pkgs.emacsWithPackagesFromUsePackage {
      package = pkgs.emacs-unstable;
      config = ./config.el;
      defaultInitFile = true;
      extraEmacsPackages = epkgs: [
	      epkgs.vterm
      ];
    });
  };
}
