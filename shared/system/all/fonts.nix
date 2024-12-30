{ pkgs, ... }: {
  fonts = {
    packages = with pkgs; [
      font-awesome
      nerd-fonts.fira-code
      nerd-fonts.jetbrains-mono
    ];
  };
}
