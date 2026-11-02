{ ... }:

{
  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "video/mp4" = [ "mpv.desktop" ];
      "video/x-matroska" = [ "mpv.desktop" ];
      "video/webm" = [ "mpv.desktop" ];
      "video/quicktime" = [ "mpv.desktop" ];
      "text/plain" = [ "nvim.desktop" ];
      "text/markdown" = [ "nvim.desktop" ];
      "text/x-nix" = [ "nvim.desktop" ];
      "application/json" = [ "nvim.desktop" ];
      "application/x-shellscript" = [ "nvim.desktop" ];
      "video/x-msvideo" = [ "mpv.desktop" ];
      "image/jpeg" = [ "imv.desktop" ];
      "image/png"  = [ "imv.desktop" ];
      "image/webp" = [ "imv.desktop" ];
      "image/gif"  = [ "imv.desktop" ];
      "x-scheme-handler/http"  = "firefox.desktop";
      "x-scheme-handler/https" = "firefox.desktop";
      "text/html"              = "firefox.desktop";
    };
  };
}

