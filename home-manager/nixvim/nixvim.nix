{ inputs, ... }:
{
  imports = [
    ./options.nix
    ./keymaps.nix
    ./plugins.nix
  ];

  programs.nixvim = {
    enable = true;
    nixpkgs.source = inputs.nixpkgs;

    colorschemes.catppuccin = {
      enable = true;
      settings = {
        flavour = "mocha";
        term_colors = true;
      };
    };

    globals = {
      mapleader = " ";
    };

    clipboard.register = "unnamedplus";
  };
}
