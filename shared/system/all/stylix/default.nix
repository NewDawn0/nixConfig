{ pkgs, ... }: {
  stylix = {
    /* Some themes I like
       @NOTE: I truncated themes with a rating below 5
       @NOTE: For custom themes like everblush use a nix path
           eg. `base16Scheme = ./themes/everblush.yaml;`
           otherwise use `base16Scheme = "${pkgs.base16-schemes}/share/themes/<theme>.yaml"`
       Rating  | name
             9 | everblush
             9 | ayu-dark
             9 | ayu-mirage
           8.5 | framer
           8.5 | chalk
             8 | catppuccin-mocha
             8 | tokyo-night-storm
             7 | everforest
             7 | horizon-dark
             6 | gruvbox-dark-medium
             6 | harmonic16-dark
             6 | classic-dark
           5.5 | nord
           5.5 | da-one-black
           5.5 | embers
           5.5 | material-darker
             5 | ocean
             5 | tarot
             5 | rose-pine-moon
             5 | ashes
             5 | darkmoss
             5 | eighties
    */
    base16Scheme = ./themes/everblush.yaml;
    polarity = "dark";
    enable = true;
    opacity.terminal = 0.95;
    image = pkgs.fetchurl {
      # Use specific commit link as normal link might change
      hash = "sha256-qK+o6/Q0JemdWEXK8DgHC0zw9zFJ4fySJd9aPxx/KPA=";
      url =
        "https://github.com/NewDawn0/walls/blob/e4ce95f7eed5f76f8ce094489c83560712289a66/src/keyz.png";
    };
    # @NOTE: Font needs to be installed in `shared/all/fonts.nix``
    fonts = let
      package = pkgs.nerd-fonts.jetbrains-mono;
      name = "JetBrainsMono Nerd Font";
    in {
      monospace = { inherit package name; };
      sansSerif = { inherit package name; };
      serif = { inherit package name; };
      sizes = {
        applications = 12;
        terminal = 12;
      };
    };
  };
}
