{ config, pkgs, nur, ... }:
{
    programs.firefox = {
        enable = true;
        globalExtensions = with pkgs.nur.repos.rycee.firefox-addons; [
            ublock-origin
            adaptive-tab-bar-colour
            privacy-badger
            sponsorblock
            ambient-light-for-youtube
            return-youtube-dislikes
            bitwarden
        ];
        policies = {
            DownloadDirectory = "${config.home.homeDirectory}/Downloads";
            ExtensionUpdate = true;
        };
        profiles.default = {
            settings = {
                "extensions.autoDisableScopes" = 0;
                "extensions.enavleScopes" = 15;
                 "browser.newtabpage.pinned" = builtins.toJSON [
                  { url = "https://github.com/";                label = "GitHub"; }
                  { url = "https://www.youtube.com/";           label = "YouTube"; }
                  { url = "https://search.nixos.org/packages";  label = "Nixos Search"; }
                  { url = "https://diary.e-school.by/#/login";  label = "Эл. Дневник"; }
                  { url = "https://www.reddit.com/";            label = "Reddit"; }
                ];
            };
        };
    };
}

