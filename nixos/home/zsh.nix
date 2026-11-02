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

      # NixOS (репо живёт в ~/nixos-files)
      nixos = "nvim ~/nixos-files/nixos/.";
      rebuild = "sudo nixos-rebuild switch --flake ~/nixos-files/nixos#devastator";
      update = "git -C ~/nixos-files pull && ~/nixos-files/scripts/install_programms.sh && sudo nixos-rebuild switch --flake ~/nixos-files/nixos#devastator";
      flakeup = "sudo nix flake update --flake ~/nixos-files/nixos";
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
