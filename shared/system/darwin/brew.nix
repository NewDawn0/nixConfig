{ lib, userInfo, ... }: {
  nix-homebrew = {
    enable = true;
    enableRosetta =
      if lib.hasPrefix "aarch64" userInfo.system then true else false;
    user = userInfo.userName;
    mutableTaps = true;
  };
  homebrew = {
    enable = true;
    brews = [ "mas" "openssl@3" ];
    casks = [
      "amethyst"
      "appcleaner"
      "balenaetcher"
      "firefox"
      "ghostty"
      "github"
      "iina"
      "languagetool"
      "microsoft-excel"
      "microsoft-outlook"
      "microsoft-powerpoint"
      "microsoft-word"
      "obs"
      "qflipper"
      "raycast"
      "whatsapp"
    ];
    masApps = {
      DavinciResolve = 571213070;
      Shazam = 897118787;
    };
    global.autoUpdate = false;
    onActivation = {
      autoUpdate = true;
      cleanup = "zap";
      upgrade = true;
    };
  };
}
