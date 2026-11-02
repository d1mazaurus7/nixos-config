{ pkgs, config, ... }:
{
  home.packages = with pkgs; [
    material-symbols
    nerd-fonts.jetbrains-mono
    noto-fonts
    noto-fonts-color-emoji
    uv
    networkmanagerapplet
    gowall
    mission-center
    lv2
    lilv
    suil
    glib
    ddcutil
    libsecret
  ];
  fonts.fontconfig = {
    enable = true;
    defaultFonts = {
      monospace = [ "JetBrainsMono Nerd Font" ];
      sansSerif = [ "Noto Sans" ];
      serif = [ "Noto Serif" ];
      emoji = [ "Noto Color Emoji" ];
    };
  };
  home.sessionVariables = {
    XCURSOR_THEME = "catppuccin-latte-light-cursors";
    XCURSOR_SIZE = "24";
    EDITOR = "nvim";
    VISUAL = "nvim";
    SUDO_EDITOR = "nvim";
  };
}
