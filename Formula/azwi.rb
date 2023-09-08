# Copyright (c) Microsoft Corporation. All rights reserved.
# Licensed under the MIT license.

class Azwi < Formula
  desc "A utility CLI that helps manage Azure AD Workload Identity and automate error-prone operations:"
  homepage "https://azure.github.io/azure-workload-identity"
  version "0.11.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/Azure/azure-workload-identity/releases/download/v#{version}/azwi-v#{version}-darwin-amd64.tar.gz"
      sha256 "02390dfc079518a482237cd4bd1a9409ff3ba0035857ab42855f1ffe9a0fb605"
    end
    if Hardware::CPU.arm?
      url "https://github.com/Azure/azure-workload-identity/releases/download/v#{version}/azwi-v#{version}-darwin-arm64.tar.gz"
      sha256 "6bc3adff6d31cd459980c942d6fced58b60b73ece8058d9783d097f5748cd444"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/Azure/azure-workload-identity/releases/download/v#{version}/azwi-v#{version}-linux-amd64.tar.gz"
      sha256 "8f64c111e055a6e50ddfca6a5ffe9a2ed807e2a45f658ec0d11024adc08ff2c4"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/Azure/azure-workload-identity/releases/download/v#{version}/azwi-v#{version}-linux-arm64.tar.gz"
      sha256 "4c895653f0f5066c1a1e449f504fb44651b0b5d86d1d06bb5fd95316166e6b2c"
    end
  end

  def install
    bin.install "azwi"

    generate_completions_from_executable(bin/"azwi", "completion")
  end

  test do
    system "#{bin}/azwi version"
  end
end
