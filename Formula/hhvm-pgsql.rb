require "formula"

class HhvmPgsql < Formula
  homepage "https://github.com/PocketRent/hhvm-pgsql"
  head "https://github.com/PocketRent/hhvm-pgsql.git", :revision => "914eaacdfdbdbe5750c15ea6a58adbb1b427628d"
  url "https://github.com/PocketRent/hhvm-pgsql/archive/914eaacdfdbdbe5750c15ea6a58adbb1b427628d.zip"
  version "914eaa"
  
  depends_on "cmake" => :build
  depends_on "postgresql"

  def install
    ENV['HPHP_HOME'] = Formula['hhvm'].opt_prefix + "/src/"

    system Formula['hhvm'].bin + "hphpize"

    system "cmake", "."
    system "make", "install" # if this fails, try separate make/make install steps
  end
end
