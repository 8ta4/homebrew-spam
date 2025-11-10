# frozen_string_literal: true

# This class represents a Homebrew formula for the spam project.
class Spam < Formula
  url 'https://github.com/8ta4/spam/releases/download/v0.1.2/spam.tar.gz'
  sha256 'eb4c4d167b30e32b3c59ad50ed4b508ae6cd9d5c5d52bf507073506c7bd80cde'
  depends_on 'node'
  depends_on 'temporal'
  def install
    libexec.install Dir['*']
    (bin / 'spam').write <<~SHELL
      #!/bin/bash
      exec "#{Formula['node'].opt_bin}/node" "#{libexec}/target/main.js" "$@"
    SHELL
  end
end
