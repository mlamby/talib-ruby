Gem::Specification.new do |gemspec|
  gemspec.name = "talib_ruby"
  gemspec.summary = "Ruby Wrapper for ta-lib"
  gemspec.description = "Ruby Wrapper for the Technical Analysis Library ta-lib"
  gemspec.email = "rivella50@gmail.com"
  gemspec.homepage = "http://github.com/rivella50/talib-ruby"
  gemspec.authors = ["Valentin Treu"]
  gemspec.extensions << 'ext/talib/extconf.rb'
  gemspec.version = '1.0.3'

  gemspec.files =  Dir.glob("example/**/*.rb")
  gemspec.files += Dir.glob("ext/**/talib.[ch]")
  gemspec.files << "README.textile"
  gemspec.files += Dir.glob("lib/**/*.rb")
  gemspec.files << "vendor/ta-lib-0.4.0-src.tar.gz"
  gemspec.test_files = []
end
