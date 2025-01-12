{ pkgs, ... }: {
  home.packages = with pkgs;
    [
      pac
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
