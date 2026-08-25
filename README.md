## GNU Stow による dotfiles 管理

各アプリの設定は GNU Stow で管理する。

### dotfiles に設定を追加する

例として `~/.config/tmux` を追加する場合。

#### 1. 保存先を作成

```bash
cd ~/dotfiles
mkdir -p tmux/.config
```

#### 2. 既存の設定を dotfiles に移動

```bash
mv ~/.config/tmux ~/dotfiles/tmux/.config/
```

ディレクトリ構成は以下のようになる。

```text
~/dotfiles/
└── tmux/
    └── .config/
        └── tmux/
            └── .tmux.conf
```

#### 3. Stow の動作確認

```bash
cd ~/dotfiles
stow -n -v tmux
```

問題なければ適用する。

```bash
stow tmux
```

これにより以下のシンボリックリンクが作成される。

```text
~/.config/tmux -> ~/dotfiles/tmux/.config/tmux
```

#### 4. Git に追加

```bash
git add .
git commit -m "Add tmux config"
git push
```

---

### 新規環境でセットアップする

#### 1. GNU Stow をインストール

macOS（Homebrew）の場合。

```bash
brew install stow
```

#### 2. dotfiles を clone

```bash
cd ~
git clone <repository-url> dotfiles
cd dotfiles
```

#### 3. 設定を適用

必要なアプリを指定して Stow を実行する。

```bash
stow nvim
stow tmux
stow wezterm
```

まとめて指定してもよい。

```bash
stow nvim tmux wezterm
```

これにより以下のようにシンボリックリンクが作成される。

```text
~/.config/nvim    -> ~/dotfiles/nvim/.config/nvim
~/.config/tmux    -> ~/dotfiles/tmux/.config/tmux
~/.config/wezterm -> ~/dotfiles/wezterm/.config/wezterm
```

### Stow を解除する

設定ファイル本体を残したままシンボリックリンクを削除する。

```bash
stow -D tmux
```

### ディレクトリ構成

```text
~/dotfiles/
├── nvim/
│   └── .config/
│       └── nvim/
├── tmux/
│   └── .config/
│       └── tmux/
└── wezterm/
    └── .config/
        └── wezterm/
```

基本的に `~/dotfiles/<package>/` 以下に、`$HOME` からのパスをそのまま再現する。
