{ config, pkgs, inputs, ... }:

{
  programs.home-manager.enable = true;
  home.stateVersion = "26.11"; # Please read the comment before changing.

  imports = [
    ./alacritty/alacritty.nix
    ./nixvim/nixvim.nix
  ];

  home.packages = with pkgs; [
    # nix tools
    nixd
    nixfmt

    # essential tools
    git
    gh
    uv

    # useful tools
    bat
    eza
    lazygit

    # fonts
    moralerspace-jpdoc

    # misc. tools
    sl
  ];

  home.file = {
    ".gitconfig".source = ./git/.gitconfig;
  };

  home.sessionVariables = {
  };

  programs = {
    # zshのカスタマイズ
    zsh = {
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
    powerline-go.enable = true;
    mise = {
      enable = true;
      enableZshIntegration = true;
    };
  };
}
