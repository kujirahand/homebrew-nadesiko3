class Gonako < Formula
  desc "日本語プログラミング言語 なでしこ3 (Go言語版)"
  homepage "https://github.com/kujirahand/nadesiko3go"
  version "3.8.4"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kujirahand/nadesiko3go/releases/download/#{version}/gonako-#{version}-darwin-arm64.zip"
      sha256 "ce78ded4d48383e89ef31256d6ed3cd6dce955e053a964154e33a49fe9e6d6c2"
    else
      url "https://github.com/kujirahand/nadesiko3go/releases/download/#{version}/gonako-#{version}-darwin-amd64.zip"
      sha256 "bb30efc02f5128786b460bd28a9693bee2b39b7c2f10c54c588dd3065d7f7dd8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kujirahand/nadesiko3go/releases/download/#{version}/gonako-#{version}-linux-arm64.zip"
      sha256 "d3838ee6aff04a090c3cf648f63725a41ca1587415798dac58b831f4a8a018a3"
    else
      url "https://github.com/kujirahand/nadesiko3go/releases/download/#{version}/gonako-#{version}-linux-amd64.zip"
      sha256 "4ef8721892577ebaa6961936e3354f7fc1135537ed1c2e00eec3d6d8335a5342"
    end
  end

  def install
    bin.install "gonako"
  end

  test do
    assert_match "こんにちは", shell_output("#{bin}/gonako -e '「こんにちは」と表示'")
  end
end
