require "formula"

class Prince < Formula
  homepage "http://www.princexml.com/"
  url "http://www.princexml.com/download/prince-11.3-macosx.tar.gz"
  sha256 "eb45c067620d7978eee6bc615fe19524039a06ef2ee1a25349e49c72ad2e84da"

  def install
    ENV["prefix"] = prefix
    system "./install.sh"
  end

  def patches
    # Drop the user input since we're providing the prefix
    DATA
  end
end

__END__
--- prince-9.0r5-macosx.orig/install.sh	2014-04-28 02:21:00.000000000 +0000
+++ prince-9.0r5-macosx/install.sh	2014-05-16 14:44:07.000000000 +0000
@@ -7,24 +7,10 @@
 VERSION="8.0"
 WEBSITE="http://www.princexml.com"
 
-prefix=/usr/local
-
 base=`dirname $0`
 
 cd "$base"
 
-echo "$PRODUCT $VERSION"
-echo
-echo "Install directory"
-echo "    This is the directory in which $PRODUCT $VERSION will be installed."
-echo "    Press Enter to accept the default directory or enter an alternative."
-echo -n "    [$prefix]: "
-
-read input
-if [ ! -z "$input" ] ; then
-    prefix="$input"
-fi
-
 echo
 echo "Installing $PRODUCT $VERSION..."
