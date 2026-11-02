# /etc/nixos/packages.nix
{ pkgs, inputs, ... }:
{
 environment.systemPackages = with pkgs; [

#---------------------------#
#--  WM & GRAPHICAL UTILS --#
#---------------------------#
    
   niri  # WM
   rofi  # launcher
   foot  # terminal
   xwayland-satellite  #  xwayland-satellite
   xdg-utils  # xdg-utils  
   awww  # Обои
   hyprpicker  # color picker 
   imv
   easyeffects  # equalizer
   playerctl  # player-daemon library
   pulseaudio
   flatpak
   ddcutil
   grim

#------------------#
#-- HOME-MANAGER --#
#------------------#

   inputs.matugen.packages.${system}.default
    
#--------------------# 
#-- TERMINAL UTILS --#
#--------------------#
   ripgrep  # better grep
   curl  # CLI HTTP-client 
   wget  # file downloader
   zip  # zip files 
   git  # git 
   unzip  # unzip files 
   gcc  # C compiler
   gnumake  # makepkg
   tree-sitter  # syntax parser 
   wl-clipboard  # clipboard 
   libnotify  # notifications library
   tree  # directory-tree
   power-profiles-daemon  # power modes
   iw
   rmpc
   appimage-run

#----------#
#-- LARP --#
#----------#
   cava
   fastfetch

#-------------------------#
#-- MP4 & MP3 & EDITORS --#
#-------------------------#
    mpd  # music player daemon
    yt-dlp  # mp4 downloader
    mpv  # MP4 & GIF

#------------------#
#-- GUI PROGRAMS --#
#------------------#
    obsidian  # notes
    pavucontrol  # gui for sound
    telegram-desktop  # messenger
    blueman  # gui for bluetooth
    obs-studio
    steam
    nautilus
    vencord
    firefox

#---------------------------#
#-- PROGRAMMING LANGUAGES --#
#---------------------------#
    rustup
    gcc
    pkg-config
    openssl.dev
    cargo
    rustfmt
    clippy
    python3
    lld
    nodejs_24

#--------------------#
#-- SHELL PROGRAMS --#
#--------------------#
    zsh  # shell 
    eza  # eza = ls
    starship  # prompt
    btop  # system info

 ] ++ [
      (inputs.quickshell.packages.${pkgs.system}.default.passthru.withModules [
      ])
 ];
}
