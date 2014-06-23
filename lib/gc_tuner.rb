require "gc_tuner/version"
require "gc_tuner/config"

module GcTuner
  class << self
    def setup
      if RUBY_VERSION >= '2.1.1'
        require 'gc_tuner/config211'
      elsif RUBY_VERSION >= '2.1'
        require 'gc_tuner/config21'
      else
        require 'gc_tuner/config19'
      end
    end

    def at_exit
    end
  end
end

GcTuner.setup

unless ENV['RAILS_ENV'] == 'test'
  at_exit do
    GcTuner.at_exit
  end
end

