class Gonako < Formula
  desc "日本語プログラミング言語 なでしこ3 (Go言語版)"
  homepage "https://github.com/kujirahand/nadesiko3go"
  version "3.8.9"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kujirahand/nadesiko3go/releases/download/#{version}/gonako-#{version}-darwin-arm64.zip"
      sha256 "6cb68d39634ec051c4c6afbf7c48d1c47e0ea2137b85531f43320725e638f034"
    else
      url "https://github.com/kujirahand/nadesiko3go/releases/download/#{version}/gonako-#{version}-darwin-amd64.zip"
      sha256 "4bd12a84280c03652c8daeeee1eeec7078f4014cd3c36c70803316136948eda5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kujirahand/nadesiko3go/releases/download/#{version}/gonako-#{version}-linux-arm64.zip"
      sha256 "68a5d37d167d2268502935e34d2660e3e92d027e84098b69952c626f2805e120"
    else
      url "https://github.com/kujirahand/nadesiko3go/releases/download/#{version}/gonako-#{version}-linux-amd64.zip"
      sha256 "fbe47f9c587bbc009e5653b5bc2fa13cef4bc7ce077736c32e04d81aaa03c182"
    end
  end

  def install
    bin.install "gonako"
  end

  test do
    assert_match "こんにちは", shell_output("#{bin}/gonako -e '「こんにちは」と表示'")
  end
end
