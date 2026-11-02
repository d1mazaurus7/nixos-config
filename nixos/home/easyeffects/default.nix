{ pkgs, config, ... }:
{
    xdg.dataFile."easyeffects/output/default.json".text = ''
    {
      "output": {
        "blocklist": [],
        "plugins_order": []
      }
    }
    '';
}
