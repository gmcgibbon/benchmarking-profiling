# frozen_string_literal: true

require "benchmark"

Benchmark.bm do |x|
  x.report("range") do
    ("a".."z").to_a
  end
  x.report("upto") do
    97.upto(122).map { |n| n.chr }
  end
  x.report("loop") do
    array = []
    i = 97
    until i > 122
      array << i.chr
      i += 1
    end
  end
end
