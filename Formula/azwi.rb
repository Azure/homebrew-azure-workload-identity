# Copyright (c) Microsoft Corporation. All rights reserved.
# Licensed under the MIT license.

class Azwi < Formula
  desc "A utility CLI that helps manage Azure AD Workload Identity and automate error-prone operations:"
  homepage "https://azure.github.io/azure-workload-identity"
  version "0.10.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/Azure/azure-workload-identity/releases/download/v#{version}/azwi-v#{version}-darwin-amd64.tar.gz"
      sha256 "617351e013bda398fa20f31294808c4ebcad6852e38a6306efcffa40cdf9501f"
    end
    if Hardware::CPU.arm?
      url "https://github.com/Azure/azure-workload-identity/releases/download/v#{version}/azwi-v#{version}-darwin-arm64.tar.gz"
      sha256 "47df2867603e4dd02a79f0c4d2d8cb2ece25a5c0ceee7671490f7689bf3e20db"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/Azure/azure-workload-identity/releases/download/v#{version}/azwi-v#{version}-linux-amd64.tar.gz"
      sha256 "e3d6b8991e408daef7211d92df002ec0937f70951c047d6cbbbd492aed15ba9a"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/Azure/azure-workload-identity/releases/download/v#{version}/azwi-v#{version}-linux-arm64.tar.gz"
      sha256 "49431833f4756124919b66e79a5702e89c1590271d83d9aa06b0a53bd0a728f9"
    end
  end

  def install
    bin.install "azwi"
  end

  test do
    system "#{bin}/azwi version"
  end
end
