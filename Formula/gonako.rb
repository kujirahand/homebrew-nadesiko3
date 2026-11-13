class Gonako < Formula
  desc "日本語プログラミング言語 なでしこ3 (Go言語版)"
  homepage "https://github.com/kujirahand/nadesiko3go"
  version "3.8.11"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kujirahand/nadesiko3go/releases/download/#{version}/gonako-#{version}-darwin-arm64.zip"
      sha256 "8185d9999d5c2d7933ec6f4dcab64eeb603bd80eb30365075c07b7b57ea0bded"
    else
      url "https://github.com/kujirahand/nadesiko3go/releases/download/#{version}/gonako-#{version}-darwin-amd64.zip"
      sha256 "4bc13ee4d93e61e4238e6014f48ce7753e6e2d4e9d8f08a26958df3a48a46499"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kujirahand/nadesiko3go/releases/download/#{version}/gonako-#{version}-linux-arm64.zip"
      sha256 "c406f8c0c7efdce8e99d9b98997f22d59ce6aead44b5ea4892ede00b4bf107bf"
    else
      url "https://github.com/kujirahand/nadesiko3go/releases/download/#{version}/gonako-#{version}-linux-amd64.zip"
      sha256 "8c62ff4b53c76961a4744d108ce50d18f1a28a467783ef3c9ff94db587a98253"
    end
  end

  def install
    bin.install "gonako"
  end

  test do
    assert_match "こんにちは", shell_output("#{bin}/gonako -e '「こんにちは」と表示'")
  end
end
