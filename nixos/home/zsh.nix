{ ... }:
{
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    enableCompletion = true;
    history = {
      size = 5000;
      save = 5000;
      share = true;
      ignoreAllDups = true;
      ignoreDups = true;
      ignoreSpace = true;
      append = true;
    };
    shellAliases = {
      # Short
      g = "git";
      t = "tree";
      qs = "quickshell";
      sw = "set-wallpaper";
      cv = "cava";
      mpc-u = "mpc update --wait";
      ef = "easyeffects";
      
      # Configs 
      niriconf = "nvim ~/.config/niri/.";
      quickconf = "nvim ~/.config/quickshell/.";

      # NixOS (конфиг живёт в /etc/nixos, ставится через install.sh из репо)
      nixos = "nvim /etc/nixos/.";
      rebuild = "sudo nixos-rebuild switch --flake /etc/nixos#devastator";
      update = "d=$(mktemp -d) && git clone --depth 1 https://github.com/d1mazaurus7/nixos-config \"$d\" && sudo bash \"$d/install.sh\"";
      optimize = "sudo nix-collect-garbage -d && sudo nix-store --optimize";

      # Downloads 
      dl-video = "yt-dlp -f 'bv*+ba/b' --merge-output-format mp4";
      dl-music = "yt-dlp -f bestaudio -x --audio-format mp3 --audio-quality 0 -o '~/Music/%(title)s.%(ext)s'";
    };
    oh-my-zsh = {
      enable = true;
      plugins = [
        "sudo"
        "git"
      ];
    };
    initContent = ''
      fastfetch
      eval "$(starship init zsh)"
    '';
  };
}
