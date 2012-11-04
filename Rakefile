begin
  require 'rake/extensiontask'
rescue LoadError
  abort <<-error
  rake-compile is missing; rake-compiler is needed to build the C wrapping code.
  Install it by running `gem install rake-compiler`
  error
end

spec = Gem::Specification.load('talib_ruby.gemspec')

Gem::PackageTask.new(spec) do |pkg|
end

Rake::ExtensionTask.new('talib') do |ext|
end
