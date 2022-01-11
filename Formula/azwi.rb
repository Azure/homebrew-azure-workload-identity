# Copyright (c) Microsoft Corporation. All rights reserved.
# Licensed under the MIT license.

class Azwi < Formula
  desc "A utility CLI that helps manage Azure AD Workload Identity and automate error-prone operations:"
  homepage "https://azure.github.io/azure-workload-identity"
  version "0.7.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/Azure/azure-workload-identity/releases/download/v#{version}/azwi-v#{version}-darwin-amd64.tar.gz"
      sha256 "d1dd0e91980b411de42a2f32fad295e8d7601b85845071d35ef5f18af0d68b5b"
    end
    if Hardware::CPU.arm?
      url "https://github.com/Azure/azure-workload-identity/releases/download/v#{version}/azwi-v#{version}-darwin-arm64.tar.gz"
      sha256 "63ae9a139e2853e0ca194877fb99eb68e6930142f6f9c67be3836c2f7f422a28"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/Azure/azure-workload-identity/releases/download/v#{version}/azwi-v#{version}-linux-amd64.tar.gz"
      sha256 "9d3bf21cc105cd96db9a6f88dc8d44a1c34061bef6127a18cfaddca8ebc6554a"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/Azure/azure-workload-identity/releases/download/v#{version}/azwi-v#{version}-linux-arm64.tar.gz"
      sha256 "40bcc6be3758b9b6d08e45e0bd582403265634b2e804c712388d2fb6509217c4"
    end
  end

  def install
    bin.install "azwi"
  end

  test do
    system "#{bin}/azwi version"
  end
end
