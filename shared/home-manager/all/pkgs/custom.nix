{ pkgs, ... }: {
  home.packages = with pkgs; [
    pac
    helix
    #   ansi
    #   dirStack
    #   ex
    #   gen
    #   nixie-clock
    #   note
    #   notify
    #   translate
    #   up
    #   vocab
  ];
}
