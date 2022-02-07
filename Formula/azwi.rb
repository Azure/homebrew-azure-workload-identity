# Copyright (c) Microsoft Corporation. All rights reserved.
# Licensed under the MIT license.

class Azwi < Formula
  desc "A utility CLI that helps manage Azure AD Workload Identity and automate error-prone operations:"
  homepage "https://azure.github.io/azure-workload-identity"
  version "0.8.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/Azure/azure-workload-identity/releases/download/v#{version}/azwi-v#{version}-darwin-amd64.tar.gz"
      sha256 "5359db2c3e69d082ec3789624e8b7ec529e442e61a3129afad01fa5606e57e06"
    end
    if Hardware::CPU.arm?
      url "https://github.com/Azure/azure-workload-identity/releases/download/v#{version}/azwi-v#{version}-darwin-arm64.tar.gz"
      sha256 "de3278c8449d7e23a3a3defc179cbd8e9c9eac43a06bd067d44d27bc411d37a4"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/Azure/azure-workload-identity/releases/download/v#{version}/azwi-v#{version}-linux-amd64.tar.gz"
      sha256 "93dbca819b2aa44b37a64a928361da68c5b8b720acf88c1371b45050ff4ab248"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/Azure/azure-workload-identity/releases/download/v#{version}/azwi-v#{version}-linux-arm64.tar.gz"
      sha256 "2e778c35606843a0a78347e7a4d04a639143ab7043cdac53edd058434fa921ad"
    end
  end

  def install
    bin.install "azwi"
  end

  test do
    system "#{bin}/azwi version"
  end
end
