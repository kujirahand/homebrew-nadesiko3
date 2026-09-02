# homebrew-nadesiko3

日本語プログラミング言語「なでしこ3」Go言語版（`gonako`, `gonako-gui`）の Homebrew Tap です。

- 本リポジトリ: [kujirahand/nadesiko3go](https://github.com/kujirahand/nadesiko3go)

---

## インストール方法

### 1. タップの追加

```bash
# tapを追加します
brew tap kujirahand/nadesiko3
# tapを信頼します
brew trust kujirahand/nadesiko3
```

### 2. インストール

#### CLI版 (`gonako`)
コマンドラインからなでしこ3を実行できます。

```bash
brew install gonako
```

実行確認:
```bash
gonako -e '「こんにちは」と表示'
```

#### GUI版 (`gonako-gui`)

日本語IMEに対応した軽量WebViewベースのエディタ＆実行環境です。`/Applications/なでしこ3.app` にインストールされます。

```bash
# ダウンロード
brew install --cask gonako-gui
# Gatekeeperのブロックを解除
xattr -cr /Applications/なでしこ3.app
```

---

## アップデート

```bash
brew update
brew upgrade gonako
brew upgrade --cask gonako-gui
# Gatekeeperのブロックを解除
xattr -cr /Applications/なでしこ3.app
```

## アンインストール

```bash
brew uninstall gonako
brew uninstall --cask gonako-gui
brew untap kujirahand/nadesiko3
```
