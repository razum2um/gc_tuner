require "gc_tuner/version"
require "gc_tuner/config"
require "gc_tuner/watcher"

if RUBY_VERSION >= '2.1.1'
  require 'gc_tuner/config211'
elsif RUBY_VERSION >= '2.1'
  require 'gc_tuner/config21'
else
  require 'gc_tuner/config19'
end

module GcTuner
end

unless ENV['RAILS_ENV'] == 'test'
  at_exit do
    GcTuner::Aggregator.instance.dump
  end
end

