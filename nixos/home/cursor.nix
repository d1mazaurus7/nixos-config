{ pkgs, config, ... }:
{
  home.pointerCursor = {
    enable = true;
    name = "catppuccin-latte-light-cursors";
    package = pkgs.catppuccin-cursors.latteLight;
    size = 24;
    gtk.enable = true;
};

home.sessionVariables = {
  XCURSOR_THEME = "catppuccin-latte-light-cursors";
  XCURSOR_SIZE = "24";
  XCURSOR_PATH = "${config.home.homeDirectory}/.icons:${config.home.homeDirectory}/.local/share/icons";
  };
}
