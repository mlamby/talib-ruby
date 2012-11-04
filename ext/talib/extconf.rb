require 'mkmf'

def sys(cmd)
  puts " -- #{cmd}"
  unless ret = xsystem(cmd)
    raise "ERROR: '#{cmd}' failed"
  end
  ret
end

CWD = File.expand_path(File.dirname(__FILE__))
VENDOR_DIR = File.join(CWD, '..', '..', 'vendor')
TARBALL = File.join(VENDOR_DIR, "ta-lib-0.4.0-src.tar.gz")
TA_LIB_DIR = File.join(CWD, 'ta-lib')

# Build the ta-lib library
sys("tar -zxf #{TARBALL}")
Dir.chdir('ta-lib') do
  sys("./configure")
  sys("make")
  # Remove the .so files so that gcc wont be tempted to use
  # them instead of the the .a files.
  sys("rm src/.libs/*.so*")
end

$INCFLAGS[0,0] = " -I#{File.join("ta-lib", "include")} "
$LDFLAGS << " -L#{File.join("ta-lib", "src", ".libs")} "

unless have_library("ta_lib")
  message "ta_lib library compilation failed\n"
  abort
end

create_makefile("talib")
