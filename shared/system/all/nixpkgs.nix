{ overlays, userInfo, ... }: {
  # Nixpkgs
  nixpkgs = {
    config.allowUnfree = true;
    hostPlatform = userInfo.system;
    overlays = overlays;
  };
  # Nix settings
  services.nix-daemon.enable = true;
  nix = {
    optimise.automatic = true;
    settings = {
      experimental-features = "nix-command flakes pipe-operators";
      substituters =
        [ "https://nix-community.cachix.org" "https://cache.nixos.org" ];
      trusted-public-keys = [
        "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      ];
      trusted-users = [ "root" "dawn" "@wheel" ];
    };
    gc = {
      automatic = true;
      options = "--delete-older-than 7d";
      user = "root";
      interval = {
        Hour = 2;
        Minute = 0;
        Weekday = 0;
      };
    };
  };
}
