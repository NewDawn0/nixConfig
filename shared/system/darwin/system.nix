{ pkgs, userInfo, ... }: {
  documentation = {
    info.enable = false;
    doc.enable = false;
  };
  security.pam.enableSudoTouchIdAuth = true;
  system = {
    defaults = {
      dock = {
        appswitcher-all-displays = false;
        autohide = true;
        autohide-delay = 0.0;
        launchanim = true;
        magnification = false;
        orientation = "left";
        persistent-apps = [
          "/Applications/Ghostty.app"
          "/Applications/Firefox.app"
          "${pkgs.obsidian}/Applications/Obsidian.app"
          "/System/Applications/Calendar.app"
          "/Applications/Microsoft Outlook.app"
        ];
        show-recents = false;
        showhidden = true;
        tilesize = 48;
      };
      finder.FXPreferredViewStyle = "clmv";
      loginwindow = {
        GuestEnabled = false;
        PowerOffDisabledWhileLoggedIn = false;
        RestartDisabled = false;
        RestartDisabledWhileLoggedIn = false;
        SHOWFULLNAME = false;
        ShutDownDisabled = false;
        ShutDownDisabledWhileLoggedIn = false;
        SleepDisabled = false;
        autoLoginUser = "Off";
      };
      menuExtraClock = {
        Show24Hour = false;
        ShowAMPM = true;
        ShowDate = 0;
        ShowDayOfMonth = true;
        ShowDayOfWeek = true;
        ShowSeconds = true;
      };
      NSGlobalDomain = {
        # Trackpad
        "com.apple.sound.beep.feedback" = 0;
        "com.apple.sound.beep.volume" = 0.25;
        "com.apple.springing.delay" = 0.5;
        "com.apple.springing.enabled" = true;
        "com.apple.swipescrolldirection" = true;
        "com.apple.trackpad.enableSecondaryClick" = true;
        # Font
        AppleFontSmoothing = 2;
        AppleInterfaceStyleSwitchesAutomatically = false;
        AppleInterfaceStyle = "Dark";
        # Units
        AppleMetricUnits = 1;
        # Finder
        AppleShowScrollBars = "Automatic";
        AppleTemperatureUnit = "Celsius";
        AppleScrollerPagingBehavior = false;
        AppleShowAllExtensions = true;
        AppleShowAllFiles = false;
        NSDocumentSaveNewDocumentsToCloud = false;
        NSTableViewDefaultSizeMode = 1;
        # Writing
        NSAutomaticCapitalizationEnabled = true;
        NSAutomaticDashSubstitutionEnabled = true;
        NSAutomaticPeriodSubstitutionEnabled = true;
        NSAutomaticQuoteSubstitutionEnabled = true;
        NSAutomaticSpellingCorrectionEnabled = false;
        NSTextShowsControlCharacters = false;
        NSUseAnimatedFocusRing = true;
        # Window
        NSAutomaticWindowAnimationsEnabled = true;
        NSDisableAutomaticTermination = false;
        NSWindowResizeTime = 1.0e-3;
        # Keyboard
        InitialKeyRepeat = 15;
        KeyRepeat = 2;

      };
      spaces.spans-displays = false;
      screensaver.askForPassword = true;
      SoftwareUpdate.AutomaticallyInstallMacOSUpdates = true;

      trackpad = {
        ActuationStrength = 0;
        Clicking = true;
        Dragging = false;
        FirstClickThreshold = 0;
        SecondClickThreshold = 0;
        TrackpadRightClick = true;
        TrackpadThreeFingerDrag = false;
      };
    };
  };
  networking = {
    computerName = userInfo.hostName;
    hostName = userInfo.hostName;
    localHostName = userInfo.hostName;
  };
}
