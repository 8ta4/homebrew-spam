# frozen_string_literal: true

# This class represents a Homebrew formula for the spam project.
class Spam < Formula
  url 'https://github.com/8ta4/spam/releases/download/v0.1.0/spam.tar.gz'
  sha256 'a37ad7445d8bb312ed7db82731fae89aed06c05e149014fff80e7228c8732567'
  def install
    libexec.install Dir['*']
    (bin / 'spam').write <<~SHELL
      #!/bin/bash
      exec "#{Formula['node'].opt_bin}/node" "#{libexec}/target/main.js" "$@"
    SHELL
  end
end
