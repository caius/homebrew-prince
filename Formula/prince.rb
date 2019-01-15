require "formula"

class Prince < Formula
  homepage "http://www.princexml.com/"
  url "https://www.princexml.com/download/prince-12.4-macosx.tar.gz"
  sha256 "7f8abe72b88468c36f41754f9fd7f17821cef0c7f8d7e83f861b39b8bf393597"

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
