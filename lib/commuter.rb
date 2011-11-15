require 'rubygems'
require 'commander/import'
require 'mapper'

program :name, "commuter"
program :version, "0.1.0"
program :description, "Commuter tells you how long your commute will be."

default_command :map

command :map do |c|

  c.option '--start ADDRESS', String, 'Specify your starting address.'
  c.option '--dest ADDRESS', String, 'Specify your destination address.'

  c.action do |args, options|
	say "From: " + options.start
	say "To:   " + options.dest
	say "The commute times are:"
	times = ::Commuter::Mapper.map(options.start, options.dest)
	say "#{times.join(' or ')}"
  end
end
