{ lib, userInfo, ... }: {
  xdg.configFile."ghostty/config" = { source = ./config; };

  # Symlink to applications dir if darwin
  home.file."Library/Application Support/com.mitchellh.ghostty/config".source =
    lib.mkIf
    (userInfo.system == "x86_64-darwin" || userInfo.system == "aarch64-darwin")
    ./config;
}
