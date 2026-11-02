{ ... }:
{
  networking = {
    hostName = "devastator";
    firewall = {
        enable = false;
    };
    useDHCP = false;
    dhcpcd.enable = false;
    networkmanager = {
      enable = true;
      wifi.powersave = false;
    };
  };
}
