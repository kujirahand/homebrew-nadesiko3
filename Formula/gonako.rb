class Gonako < Formula
  desc "日本語プログラミング言語 なでしこ3 (Go言語版)"
  homepage "https://github.com/kujirahand/nadesiko3go"
  version "3.8.3"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kujirahand/nadesiko3go/releases/download/#{version}/gonako-#{version}-darwin-arm64.zip"
      sha256 "badc624b811e783e66a0099b8271ffc166e9c5a6d71fd58a8dc65a1d695dc735"
    else
      url "https://github.com/kujirahand/nadesiko3go/releases/download/#{version}/gonako-#{version}-darwin-amd64.zip"
      sha256 "2ecb2d6c74db8555989b35dbf77af785bcdb046c3432438425f30cb54fa4fb90"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kujirahand/nadesiko3go/releases/download/#{version}/gonako-#{version}-linux-arm64.zip"
      sha256 "876b3a836575c3859e5cec37c47be795ff88fa5ebacc03927c1323da6cec4159"
    else
      url "https://github.com/kujirahand/nadesiko3go/releases/download/#{version}/gonako-#{version}-linux-amd64.zip"
      sha256 "c5571fc027f77ac56cdc77ed150093338fe893a7cb450b2aaa7e4236861f2a1a"
    end
  end

  def install
    bin.install "gonako"
  end

  test do
    assert_match "こんにちは", shell_output("#{bin}/gonako -e '「こんにちは」と表示'")
  end
end
