{
  programs.nixvim = {
    opts = {
      # インデント関連
      expandtab = true;
      tabstop = 2;
      shiftwidth = 2;
      softtabstop = 2;
      smartindent = true;

      # 行番号
      number = true;
      relativenumber = true;

      # 検索
      ignorecase = true;
      smartcase = true;
      hlsearch = true;
      incsearch = true;

      cursorline = true;

      mouse = "";
    };
  };
}
