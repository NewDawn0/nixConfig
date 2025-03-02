{ userInfo, lib, ... }: {
  xdg.configFile."ghostty/config" = { source = ./config; };
  home.file."Library/Application Support/com.mitchellh.ghostty/config" =
    lib.mkIf (userInfo.system == "x86_64-darwin" || userInfo.system
      == "aarch64-darwin") { source = ./config; };
}
