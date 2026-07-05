{ pkgs, ... }:
let
  moduleImporter = import ../../recursive-nix-modules.nix;
  commonModules = moduleImporter.recursiveImportModules ./. {};
in
{
  imports = commonModules;
  
  programs.home-manager.enable = true;
  home.stateVersion = "26.11"; # Please read the comment before changing.

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

    # programming
    go

    # misc. tools
    sl
  ];

  home.file = {
    ".gitconfig".source = ./git/.gitconfig;
  };

  home.sessionVariables = {
  };

  programs = {
    mise = {
      enable = true;
      enableZshIntegration = true;
    };
  };
}
