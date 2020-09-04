require "formula"

class Prince < Formula
  homepage "http://www.princexml.com/"
  url "https://www.princexml.com/download/prince-13-macosx.tar.gz"
  sha256 "76e27d60d50b2fd030c35b112d0d2ed1adc2b6150fa18c9697186cdd8d569e83"

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
