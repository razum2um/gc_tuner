require 'gc_tuner/config'

module GcTuner
  class Config21 < Config
    # Growth factor of expanding object space
    # Grow object space exponentially to reduce GC time
    def ruby_gc_heap_growth_factor
      1.8
    end

    # Stop exponential expanding, start linear expanding
    def ruby_gc_heap_growth_max_factor
      0
    end

    # Similar to RUBY_GC_MALLOC_LIMIT(…),
    # but parameter for major (full) GC timing
    def ruby_gc_oldmalloc_limit
      16 * MEGABYTE
    end

    # Similar to RUBY_GC_MALLOC_LIMIT_MAX(…),
    # but parameter for major (full) GC timing
    def ruby_gc_oldmalloc_limit_max
      128 * MEGABYTE
    end

    # Similar to RUBY_GC_MALLOC_LIMIT_GROWTH_FACTOR(…),
    # but parameter for major (full) GC timing
    def ruby_gc_oldmalloc_limit_growth_factor
      1.4
    end
  end

  class GcConfig < Config21
  end
end
