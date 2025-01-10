{ config, pkgs, ... }: {
  programs.zsh = {
    enable = true;
    autocd = false;
    completionInit = "autoload -U compinit && compinit";
    enableCompletion = true;
    syntaxHighlighting.enable = true;
    autosuggestion = {
      enable = true;
      highlight = with config.lib.stylix.colors.withHashtag;
        "fg=${base0E},bg=bold";
    };
    history = {
      ignoreAllDups = true;
      share = false;
      size = 10000;
    };
    initExtra = ''
      source ${pkgs.zsh-autopair}/share/zsh/zsh-autopair/autopair.zsh
      source ${pkgs.zsh-you-should-use}/share/zsh/plugins/you-should-use/you-should-use.plugin.zsh
      bindkey '^a' autosuggest-accept
      bindkey -v
      autopair-init
      function ds () {
        output=$(dirStack $*)
        while IFS= read -r line; do
          if [[ $line == EXEC:* ]]; then
            eval "''${line#EXEC: }"
          else
            echo -e $line
          fi
        done <<< "$output"
      }
      function up() {
        eval $(up-core "$@")
      }
      # Pac startup
      pac
    '';
  };
}
