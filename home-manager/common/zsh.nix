{ ... }:
{
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    shellAliases = {
      ls = "eza --icons";
      la = "eza --icons -a";
      ll = "eza -la --icons";
      lt = "eza -T -L 3 -a -I 'node_modules|.git|.cache' --icons";
      lta = "eza -T -a -I 'node_modules|.git|.cache' --color=always --icons";
    };
  };

  programs.powerline-go.enable = true;
}