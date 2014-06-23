require "gc_tuner/version"
require "gc_tuner/config"

module GcTuner
  class << self
    def setup
      if File.exists? patch_config
        require patch_config
        true
      elsif File.exists? minor_config
        require minor_config
        true
      else
        false
      end
    end

    def minor_config
      File.expand_path("../gc_tuner/config#{RUBY_VERSION.split('.')[0..1].join}.rb", __FILE__)
    end

    def patch_config
      File.expand_path("../gc_tuner/config#{RUBY_VERSION.split('.').join}.rb", __FILE__)
    end
  end
end

GcTuner.setup

