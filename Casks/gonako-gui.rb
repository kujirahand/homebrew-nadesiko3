cask "gonako-gui" do
  version "3.8.10"

  if Hardware::CPU.arm?
    url "https://github.com/kujirahand/nadesiko3go/releases/download/#{version}/gonako-gui-#{version}-darwin-arm64.app.zip"
    sha256 "1eb5bb48ea740e6400bffe31897c606368b39058afd859fd4084e2d80558d8cb"
  else
    url "https://github.com/kujirahand/nadesiko3go/releases/download/#{version}/gonako-gui-#{version}-darwin-amd64.app.zip"
    sha256 "2ae894d7aa447a7a747bb8fe21e81739ec9c2358d2644075a27d6abc418e55c8"
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
