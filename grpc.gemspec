# -*- ruby -*-
# encoding: utf-8
$LOAD_PATH.push File.expand_path('../src/ruby/lib', __FILE__)
require 'grpc/version'

Gem::Specification.new do |s|
  s.name          = 'grpc'
  s.version       = GRPC::VERSION
  s.authors       = ['gRPC Authors']
  s.email         = 'temiola@google.com'
  s.homepage      = 'https://github.com/google/grpc/tree/master/src/ruby'
  s.summary       = 'GRPC system in Ruby'
  s.description   = 'Send RPCs from Ruby using GRPC'
  s.license       = 'Apache-2.0'

  s.required_ruby_version = '>= 2.3.0'

  s.files = %w( Makefile .yardopts )
  s.files += %w( etc/roots.pem )
  s.files += Dir.glob('src/ruby/bin/**/*')
  s.files += Dir.glob('src/ruby/ext/**/*')
  s.files += Dir.glob('src/ruby/lib/**/*').reject do |f|
    # Binaries are included by rake-compiler and would lead to circular dependencies here
    File.fnmatch("**/?.?/grpc_c.so", f)
  end
  s.files += Dir.glob('src/ruby/pb/**/*').reject do |f|
    f.match(%r{^src/ruby/pb/test})
  end
  s.files += Dir.glob('include/grpc/**/*')
  s.test_files = Dir.glob('src/ruby/spec/**/*')
  s.bindir = 'src/ruby/bin'
  s.require_paths = %w( src/ruby/lib src/ruby/bin src/ruby/pb )
  s.platform      = Gem::Platform::RUBY

  s.add_dependency 'google-protobuf', '~> 3.11'
  s.add_dependency 'googleapis-common-protos-types', '~> 1.0'

  s.add_development_dependency 'bundler',            '>= 1.9'
  s.add_development_dependency 'facter',             '~> 2.4'
  s.add_development_dependency 'logging',            '~> 2.0'
  s.add_development_dependency 'simplecov',          '~> 0.14.1'
  s.add_development_dependency 'rake',               '~> 13.0'
  s.add_development_dependency 'rake-compiler',      '~> 1.1'
  s.add_development_dependency 'rake-compiler-dock', '~> 1.0'
  s.add_development_dependency 'rspec',              '~> 3.6'
  s.add_development_dependency 'rubocop',            '~> 0.49.1'
  s.add_development_dependency 'signet',             '~> 0.7'
  s.add_development_dependency 'googleauth',         '>= 0.5.1', '< 0.10'

  s.extensions = %w(src/ruby/ext/grpc/extconf.rb)
