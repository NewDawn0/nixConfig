{ pkgs, ... }: {
  home.packages = with pkgs;
    if stdenv.isDarwin then [ pinentry_mac ] else [ pinentry-qt ];
  programs.git = {
    enable = true;
    userName = "NewDawn0";
    userEmail = "newdawn.v0.0+git@gmail.com";
    aliases = {
      untag = ''!sh -c 'git tag -d "$1" && git push origin -d $1' -'';
      br = "branch";
      ch = "checkout";
      cm = "commit -m";
      ca = "commit --amend";
      df = "diff";
      pl = "pull";
      pu = "push";
      root = "rev-parse --show-toplevel";
      st = "status";
      re = "restore";
    };
    ignores = [
      # General
      ".DS_Store"
      ".idea"
      "*.swp"
      # Lang
      "node_modules/"
      "npm-debug.log"
      "__pycache__"
      ".ipynb_checkpoints"
      "pytest_cache"
      ".mypy_cache"
      ".egg-info"
      ".ccls_cache/"
      "*.pyc"
      ".dSYM"
      ".o"
      "result/"
      "target/"
    ];
    extraConfig = {
      init.defaultBranch = "main";
      push.autoSetupRemote = true;
      pull.rebase = true;
    };
    delta = {
      enable = true;
      options.side-by-side = true;
    };
    lfs.enable = true;
    signing = {
      key = "0xF407CF2A283453F3";
      signByDefault = true;
    };
  };
}
