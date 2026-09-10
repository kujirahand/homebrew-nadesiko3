cask "gonako-gui" do
  version "3.8.3"

  if Hardware::CPU.arm?
    url "https://github.com/kujirahand/nadesiko3go/releases/download/#{version}/gonako-gui-#{version}-darwin-arm64.app.zip"
    sha256 "2a5757780b8eba3a0234ee03fe1f3d30c54d087f703903c40e0e9d7958af7cc0"
  else
    url "https://github.com/kujirahand/nadesiko3go/releases/download/#{version}/gonako-gui-#{version}-darwin-amd64.app.zip"
    sha256 "37ddb9eadef3be5d7e0db532580d18b1a21d53ca512878f74935123e6111c09f"
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
