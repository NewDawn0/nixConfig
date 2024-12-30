{ pkgs, ... }: {
  xdg.configFile."amethyst/amethyst.yml" = {
    source = (pkgs.formats.yaml { }).generate "_" {
      # General
      ignore-menu-bar = false;
      restore-layouts-on-launch = true;
      enables-layout-hud = true;
      enables-layout-hud-on-space-change = true;
      new-windows-to-main = false;
      follow-space-thrown-windows = true;

      # Layouts
      layouts = [ "tall" "tall-right" "fullscreen" "floating" ];

      # Key - Mods
      mod1 = [ "control" "command" ];
      mod2 = [ "control" "shift" ];
      mod3 = [ "command" "shift" ];
      unbound = [ "control" "command" "option" "shift" ];

      # Key - Keybinds
      relaunch-amethyst = {
        mod = "mod3";
        key = "r";
      };

      cycle-layout = {
        mod = "mod1";
        key = "space";
      };

      cycle-layout-backward = {
        mod = "mod3";
        key = "space";
      };

      focus-cw = {
        mod = "mod1";
        key = "l";
      };

      focus-ccw = {
        mod = "mod1";
        key = "h";
      };

      focus-main = {
        mod = "mod1";
        key = "m";
      };

      shrink-main = {
        mod = "mod2";
        key = "l";
      };

      expand-main = {
        mod = "mod2";
        key = "h";
      };

      swap-cw = {
        mod = "mod3";
        key = "l";
      };

      swap-ccw = {
        mod = "mod3";
        key = "h";
      };

      swap-main = {
        mod = "mod3";
        key = "m";
      };

      display-current-layout = {
        mod = "mod3";
        key = "i";
      };

      select-fullscreen-layout = {
        mod = "mod1";
        key = "f";
      };

      select-tall-right-layout = {
        mod = "mod1";
        key = "t";
      };

      throw-space-left = {
        mod = "mod3";
        key = "h";
      };

      throw-space-right = {
        mod = "mod3";
        key = "l";
      };

      select-floating-layout = {
        mod = "mod3";
        key = "f";
      };

      toggle-float = {
        mod = "mod2";
        key = "f";
      };

      # Key - Unbound keybinds
      swap-screen-ccw = {
        mod = "unbound";
        key = "!";
      };
      swap-screen-cw = {
        mod = "unbound";
        key = "!";
      };
      increase-main = {
        mod = "unbound";
        key = "!";
      };
      decrease-main = {
        mod = "unbound";
        key = "!";
      };
      select-wide-layout = {
        mod = "unbound";
        key = "!";
      };
      select-column-layout = {
        mod = "unbound";
        key = "!";
      };
      select-tall-layout = {
        mod = "unbound";
        key = "!";
      };
      reevaluate-windows = {
        mod = "unbound";
        key = "!";
      };

      # Mouse
      mouse-swaps-windows = true;
      mouse-resizes-windows = true;
      mouse-follows-focus = false;
      focus-follows-mouse = false;

      # Window
      window-resize-step = 5;
      window-max-count = 0;
      window-minimum-height = 30;
      window-minimum-width = 30;

      # Floating
      floating = [ ];
      floating-is-blacklist = true;
      float-small-windows = true;

      # Padding
      window-margins = true;
      window-margin-size = 8;
      screen-padding-bottom = 0;
      screen-padding-right = 0;
      screen-padding-left = 0;
      screen-padding-top = 0;
      disable-padding-on-builtin-display = false;
      smart-window-margins = false;

      # Dev
      debug-layout-info = false;
      use-canary-build = false;
    };
  };
}
