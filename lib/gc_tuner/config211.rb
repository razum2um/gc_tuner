require 'gc_tuner/config'

module GcTuner
  class Config211 < Config
    # Tuning major (full) GC frequency
    # Bigger value: rare, Smaller value: frequent
    # < 1.0: Every GC will be major (full) GC
    def ruby_gc_heap_oldobject_limit_factor
      2.0
    end
  end

  class GcConfig < Config211
  end
end
