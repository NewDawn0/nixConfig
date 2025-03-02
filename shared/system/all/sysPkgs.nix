{ pkgs, ... }:
let
  nix-dev = pkgs.writeShellScriptBin "nix-dev" ''
    if [ -d $NIX_INSTALL_DIR/shells ]; then
      if [ $# -gt 1 ]; then
        case $1 in
          "run")
            nix develop ''${NIX_INSTALL_DIR}#$2 -c zsh
          ;;
          *)
            echo "Unknown subcommand $1"
            exit 1
          ;;
        esac
      else
        echo "Run available shells using 'nix-dev run <shell>'"
        echo "Shells:"
        for file in $NIX_INSTALL_DIR/shells/*; do
          name=$(basename ''${file%.nix})
          echo " '-> $name"
        done
      fi
    else
      echo '$NIX_INSTALL_DIR/shells directory does not exist'
      echo 'Set NIX_INSTALL_DIR to where your system config is located'
      exit 1
    fi
  '';
in {
  environment.systemPackages = with pkgs; [
    (ndnvim.override { langs.all.enabled = true; })
    coreutils
    curl
    fd
    ffmpeg
    file
    git
    gnused
    killall
    less
    nix-dev
    nixfmt-classic
    pkg-config
    ripgrep
    wget
  ];
}
