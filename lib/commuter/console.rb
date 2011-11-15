require 'rubygems'
require 'commander/import'
require 'commuter/mapper'
require 'commuter/version'

module Commuter
  module Console

    def self.run
      program :name, "commuter"
      program :version, Commuter::VERSION
      program :description, "Commuter tells you how long your commute will be."

      default_command :map

      command :map do |c|

        c.option '--start ADDRESS', String, 'Specify your starting address.'
        c.option '--dest ADDRESS', String, 'Specify your destination address.'

        c.action do |args, options|
        say "From: " + options.start
        say "To:   " + options.dest
        say "Possible commute times are:"
        times = ::Commuter::Mapper.map(options.start, options.dest)
        say times.first
        end

      end
    end

  end
end

