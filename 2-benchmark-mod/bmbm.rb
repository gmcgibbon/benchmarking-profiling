# frozen_string_literal: true

require "benchmark"

array = ["a", "a", "b", "c", "c", "c"] * 3_000_000

Benchmark.bmbm do |x|
  x.report("uniq") do
    array.dup.uniq
  end
  x.report("uniq!") do
    array.dup.uniq!
  end
end
