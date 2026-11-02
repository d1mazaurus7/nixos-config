{ pkgs, config, ... }:
{
services.mpd = {
  enable = true;
  musicDirectory = "${config.home.homeDirectory}/Music";
  extraConfig = ''
    audio_output {
        type        "pulse"
        name        "Speakers / Headphones"
        mixer_type  "software"
    }
    audio_output {
      type    "fifo"
      name    "Visualizer"
      path    "/tmp/mpd.fifo"
      format  "44100:16:2"
     }
    '';
    };

    services.mpd-mpris.enable = true;
}
