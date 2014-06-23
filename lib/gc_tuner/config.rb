module GcTuner
  class Config
    MEGABYTE = 1048576

    def dump

    end

    # How many slots prepared at initialize
    def ruby_gc_init_slots
      10_000
    end

    # At least how many slots are available after GC
    # free_min = max(RUBY_GC_HEAP_FREE_SLOTS , total_slots * 0.3)
    def ruby_gc_heap_free_slots
      4096
    end

    # Initial value of "malloc_limt"
    # Bigger: rare → High throughput, but consumes memory
    # Smaller: frequent → Low throughput, small memory
    def ruby_gc_malloc_limit
      16 * MEGABYTE
    end

    # Maximum value of "malloc_limit"
    def ruby_gc_malloc_limit_max
      32 * MEGABYTE
    end

    # Growth ratio of "malloc_limit"
    def ruby_gc_malloc_limit_growth_factor
      1.4
    end

    private

    def rails?
      defined? Rails
    end
  end
end
