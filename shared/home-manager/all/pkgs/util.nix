{ pkgs, ... }: {
  home.packages = with pkgs; [
    colima
    docker
    figlet
    imagemagick
    onefetch
    qemu
    sqlite-utils
    license-cli
  ];
}
