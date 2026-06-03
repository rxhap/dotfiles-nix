{
  programs.nixvim = {
    keymaps = [
      { mode = "i"; key = "jk"; action = "<ESC>"; }
      { mode = "n"; key = "U"; action = "<C-r>"; }

      # 移動系
      { mode = "n"; key = "H"; action = "^"; }
      { mode = "v"; key = "H"; action = "^"; }
      { mode = "n"; key = "L"; action = "$"; }
      { mode = "v"; key = "L"; action = "$"; }
      { mode = "n"; key = "J"; action = "<C-d>"; }
      { mode = "v"; key = "J"; action = "<C-d>"; }
      { mode = "n"; key = "K"; action = "<C-u>"; }
      { mode = "v"; key = "K"; action = "<C-u>"; }

    ];
  };
}
