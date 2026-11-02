{ pkgs, config, lib, ... }:

let
    cache = config.xdg.cacheHome;
    stateFile = "${cache}/current_wallpaper";
    linkFile = "${cache}/current_wallpaper_link";
in
{
    home.packages = [ pkgs.awww ];
    home.file.".local/bin/set-wallpaper" = {
      executable = true;
      text = ''
       #!/usr/bin/env bash
       set -euo pipefail
       WALLPAPER="''${1:-}"
       STATE_FILE="${stateFile}"
       LINK_FILE="${linkFile}"
       if [[ -z "$WALLPAPER" || ! -f "$WALLPAPER" ]]; then
          echo "Использование: set-wallpaper /путь/к/изображению.jpg" >&2
          exit 1
        fi 
        WALLPAPER="$(realpath "$WALLPAPER")"
        if ! awww query &>/dev/null; then
          awww-daemon &
          for _ in $(seq 1 50); do
            awww query &>/dev/null && break
            sleep 0.05
          done
        fi 
        awww img "$WALLPAPER" --transition-type fade --transition-duration 0.5
        mkdir -p "$(dirname "$STATE_FILE")"
        echo "$WALLPAPER" > "$STATE_FILE"
        ln -sfn "$WALLPAPER" "$LINK_FILE"
        matugen image ~/.cache/current_wallpaper_link --source-color-index 0
        clear
      '';
    };
    home.sessionPath = [ "${config.home.homeDirectory}/.local/bin" ];
}
