cask "gonako-gui" do
  version "3.8.5"

  if Hardware::CPU.arm?
    url "https://github.com/kujirahand/nadesiko3go/releases/download/#{version}/gonako-gui-#{version}-darwin-arm64.app.zip"
    sha256 "28b8088cc1573a36b43b5b3202f19e4e2c2f94c6bcab7456470c256520b41490"
  else
    url "https://github.com/kujirahand/nadesiko3go/releases/download/#{version}/gonako-gui-#{version}-darwin-amd64.app.zip"
    sha256 "95e24e46c25d88b701704bb867c57fed6ea14e183ad15b7dd4b0f84df7629281"
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
