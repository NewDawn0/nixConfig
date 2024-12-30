{ pkgs, userInfo, ... }:
let
  mkConfigSource = logo:
    (pkgs.formats.json { }).generate "_" {
      "$schema" =
        "https://github.com/fastfetch-cli/fastfetch/raw/dev/doc/json_schema.json";
      inherit logo;
      modules = [
        "title"
        "separator"
        "os"
        "host"
        "kernel"
        "uptime"
        "packages"
        "icons"
        "terminal"
        "cpu"
        "gpu"
        "memory"
        "swap"
        "disk"
        "localip"
        "break"
        "colors"
      ];
    };
in {
  programs.fastfetch = { enable = true; };
  xdg.configFile."fastfetch/ibm.jsonc" = {
    source = mkConfigSource {
      source = "${userInfo.userHome}/.config/fastfetch/logos/ibm.txt";
      color = {
        "1" = "blue";
        "2" = "yellow";
        "3" = "green";
        "4" = "red";
      };
    };
  };
  xdg.configFile."fastfetch/megamind.jsonc" = {
    source = mkConfigSource {
      source = "${userInfo.userHome}/.config/fastfetch/logos/megamind.txt";
      color = {
        "1" = "blue";
        "2" = "yellow";
        "3" = "green";
        "4" = "red";
      };
    };
  };
  xdg.configFile."fastfetch/logos/ibm.txt" = { source = ./ibm.txt; };
  xdg.configFile."fastfetch/logos/megamind.txt" = { source = ./megamind.txt; };
}
