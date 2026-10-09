cask "gonako-gui" do
  version "3.8.9"

  if Hardware::CPU.arm?
    url "https://github.com/kujirahand/nadesiko3go/releases/download/#{version}/gonako-gui-#{version}-darwin-arm64.app.zip"
    sha256 "2338717fa6021f17c8caee7de2362b48a1f208fd9efb6947eb8113752020974d"
  else
    url "https://github.com/kujirahand/nadesiko3go/releases/download/#{version}/gonako-gui-#{version}-darwin-amd64.app.zip"
    sha256 "ff067076aaa1baeb41dd24c5893812bff02b3eebfde328d8364abaf2d1b0a6dc"
  end

  name "なでしこ3 (gonako-gui)"
  desc "日本語プログラミング言語 なでしこ3 GUIエディタ＆実行環境"
  homepage "https://github.com/kujirahand/nadesiko3go"

  app "gonako-gui-#{version}-darwin-#{Hardware::CPU.arm? ? "arm64" : "amd64"}.app", target: "gonako-gui.app"

  postflight_steps do
    run "/usr/bin/xattr", args: ["-cr", "{{appdir}}/gonako-gui.app"]
  end

  zap trash: [
    "~/Library/Saved Application State/com.nadesiko3.gonako.gui.savedState",
  ]
end
