{
  self,
  ...
}:
{
  nixpkgs.hostPlatform = "aarch64-darwin";
  system = {
    stateVersion = 7;
    configurationRevision = self.rev or self.dirtyRev or null;
    primaryUser = "rxhap";
  };

  users.users.rxhap.home = "/Users/rxhap";
  nix.enable = false; # nix-darwinによるnix管理を無効化

  programs.zsh.enable = true; # デフォルトのシェルをzshにする
  security.pam.services.sudo_local.touchIdAuth = true; # sudo認証をTouch IDでできるようにする

  system.defaults = {
    NSGlobalDomain = {
      # マウス/トラックパッド
      "com.apple.swipescrolldirection" = true; # ナチュラルスクロールを有効化
      # キーボード
      NSAutomaticCapitalizationEnabled = false; # 文頭の自動大文字化を無効化
      NSAutomaticPeriodSubstitutionEnabled = false; # ピリオドの自動置換を無効化
      NSAutomaticSpellingCorrectionEnabled = false; # スペル自動修正を無効化
      NSAutomaticDashSubstitutionEnabled = false; # ダッシュの自動置換を無効化
      NSAutomaticQuoteSubstitutionEnabled = false; # クォートの自動置
      # UI
      AppleInterfaceStyle = "Dark"; # ダークモードを有効化
      NSWindowResizeTime = 0.001; # ウィンドウのリサイズ速度を高速化
    };

    finder = {
      AppleShowAllExtensions = true; # ファイル拡張子を常に表示
      AppleShowAllFiles = true; # 隠しファイルを表示
      FXDefaultSearchScope = "SCcf"; # 検索範囲をカレントフォルダに設定
      ShowPathbar = true; # パスバーを表示
      FXEnableExtensionChangeWarning = false; # ファイル拡張子変更の警告を無効化
      FXPreferredViewStyle = "Nlsv"; # デフォルトの表示方法をリストビューに設定
    };

    dock = {
      show-process-indicators = true; # 起動中アプリをインジケーターに表示
      show-recents = false; # 最近使ったアプリを非表示
      launchanim = false; # アプリ起動時のアニメーションを無効化
      mineffect = "scale"; # ウィンドウを閉じるときのエフェクトをスケールに設定
    };

    screencapture = {
      disable-shadow = true; # スクリーンショットの影を無効化
    };

    CustomUserPreferences = {
      NSGlobalDomain = {
        # キーボード
        WebAutomaticSpellingCorrectionEnabled = false; # スペル自動修正を無効化 (WebView)
        # Finder
        AppleMenuBarVisibleInFullscreen = true; # フルスクリーン時にメニューバーを表示
      };
    };
  };
  power = {
    sleep = {
      computer = 30; # 自動スリープまでの時間（分）
      display = 10; # ディスプレイの自動スリープまでの時間（分）
    };
  };
}
