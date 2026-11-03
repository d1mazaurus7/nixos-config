# /etc/nixos/home/default.nix
{ config, pkgs, inputs, ... }:
{
  imports = [
    ./environment.nix
    ./xdg-default.nix
    ./zsh.nix
    ./services.nix
    ./set-wallpaper.nix
    ./cursor.nix
    ./firefox.nix
    ./spicetify.nix

    # easyeffects
    ./easyeffects/atmosphere.nix
    ./easyeffects/bass.nix
    ./easyeffects/default.nix
    ./easyeffects/video.nix
  ];
  home.sessionPath = [ "$HOME/.cargo/bin" ];
  home.username = "devastator";
  home.homeDirectory = "/home/devastator";
  home.stateVersion = "26.05";

  programs.home-manager.enable = true;
}
