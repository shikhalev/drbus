# encoding: utf-8

require 'set_version'
require_relative 'lib/drbus'

Gem::Specification.new do |g|

  g.name = File.basename __FILE__, ".gemspec"
  g.summary = 'A control center for distributed Ruby system'
  g.author = 'Ivan Shikhalev'
  g.email = 'shikhalev@gmail.com'
  g.homepage = 'https://github.com/shikhalev/drbus'
  g.description = g.summary + '.'
  g.license = 'GNU LGPLv3'
  g.files = [ 'README.md', 'LICENSE' ] +
      Dir['bin/*'] + Dir['lib/**/*']

  g.set_version(*DRBus::VERSION, git: true)

  g.require_path = 'lib'
  g.required_ruby_version = '~> 2.0'

end
