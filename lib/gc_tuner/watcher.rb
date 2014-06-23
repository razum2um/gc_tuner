require 'yaml'
require 'singleton'

module GcTuner
  class Watcher
    include Singleton

    attr_reader :max, :min, :avg

    def dump
      File.open(dump_filename, "w") do |f|
        f.write(YAML.dump({}))
      end
    end

    def dump_filename
      "#{Dir.home}/.gc_tuner/aggregator_#{Process.pid}.yml"
    end
  end
end
