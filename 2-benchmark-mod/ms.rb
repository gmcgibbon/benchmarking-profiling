# frozen_string_literal: true

require "benchmark"
require "active_support/core_ext/benchmark"
require "json"
require "pathname"

milliseconds = Benchmark.ms do
  file = Pathname.new(__dir__).join("fixtures", "example.json")
  JSON.parse(file.read)
end

puts "Took #{milliseconds} milliseconds"
