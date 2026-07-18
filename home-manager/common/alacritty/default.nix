{ pkgs, ... }:

{
  programs.alacritty = {
    enable = true;
    theme = "catppuccin_mocha";

    settings = {
      window = {
        dimensions = {
          columns = 95;
          lines = 24;
        };
        dynamic_padding = true;
        option_as_alt = "Both";
      };
      scrolling = {
        history = 100000;
      };
      font = {
        normal = {
          family = "Moralerspace Neon JPDOC";
          style = "Regular";
        };
        size = 13;
      };
    };
  };
}
