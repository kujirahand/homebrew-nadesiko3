class Gonako < Formula
  desc "日本語プログラミング言語 なでしこ3 (Go言語版)"
  homepage "https://github.com/kujirahand/nadesiko3go"
  version "3.8.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kujirahand/nadesiko3go/releases/download/#{version}/gonako-#{version}-darwin-arm64"
      sha256 "dd6218bcb28e3406356b051350530c1082fae62b70399e429fed9de0f6ab9c27"
    else
      url "https://github.com/kujirahand/nadesiko3go/releases/download/#{version}/gonako-#{version}-darwin-amd64"
      sha256 "c73a41a438f67d32c2da912997aa0652a20cbd13154141d6be26f9f94fc56cbf"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kujirahand/nadesiko3go/releases/download/#{version}/gonako-#{version}-linux-arm64"
      sha256 "8afb627a44106f394c35295941842271264739eecc77a6cd348304e1b84895a1"
    else
      url "https://github.com/kujirahand/nadesiko3go/releases/download/#{version}/gonako-#{version}-linux-amd64"
      sha256 "1dcac44e6a9b1b42587d7824010dda5ce8e726521750c2ae18f1313acddfefa9"
    end
  end

  def install
    cpu = Hardware::CPU.arm? ? "arm64" : "amd64"
    os = OS.mac? ? "darwin" : "linux"
    bin.install "gonako-#{version}-#{os}-#{cpu}" => "gonako"
  end

  test do
    assert_match "こんにちは", shell_output("#{bin}/gonako -e '「こんにちは」と表示'")
  end
end
