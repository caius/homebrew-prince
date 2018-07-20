require "formula"

class Prince < Formula
  homepage "http://www.princexml.com/"
  url "http://www.princexml.com/download/prince-12-macosx.tar.gz"
  sha256 "e72467a5f6d4b6923e52ca984a2a21a5253a22b947f9cd1a0bebecd25ca57f65"

  patch :DATA

  def install
    ENV["prefix"] = prefix
    system "./install.sh"
  end
end

__END__
--- prince-12-macosx/install.sh	2018-06-07 14:06:35.000000000 +0100
+++ prince-12-macosx/install.sh	2018-06-07 14:06:35.000000000 +0100
@@ -8,2 +7,0 @@
-prefix=/usr/local
-
@@ -14,12 +11,0 @@
-echo "$PRODUCT $VERSION"
-echo
-echo "Install directory"
-echo "    This is the directory in which $PRODUCT $VERSION will be installed."
-echo "    Press Enter to accept the default directory or enter an alternative."
-printf "    [%s]: " "$prefix"
-
-IFS= read -r input
-if [ ! -z "$input" ] ; then
-    prefix="$input"
-fi
-
