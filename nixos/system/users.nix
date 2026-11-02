# /system/users.nix
{ pkgs, ... }: 
{ 
  systemd.tmpfiles.rules = [
    	"d /etc/nixos 0775 root wheel - -"
    	"Z /etc/nixos 0775 root wheel - -"
  ];
  users.users."devastator" = {
    isNormalUser = true;
    initialPassword = "devastator"; # сменить через passwd после первого входа
    shell = pkgs.zsh;
    description = "devastator";
    extraGroups = [ "networkmanager" "wheel" "adbusers" ];
  };
}
