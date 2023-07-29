{ pkgs, ... }:
{
  gtk = {
    enable = true;
    theme.name = "adw-gtk3-dark";
    theme.package = pkgs.adw-gtk3;
  };

  dconf = {
    enable = true;
    settings = {
      "org/gnome/desktop/interface" = {
        color-scheme = "prefer-dark";
      };
      "org/gnome/desktop/wm/preferences" = {
        button-layout = ":minimize,maximize,close";
      };
      "org/gnome/mutter" = {
        center-new-windows = true;
      };
    };
  };
}
