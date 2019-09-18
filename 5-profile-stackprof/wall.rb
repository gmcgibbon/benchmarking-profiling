# frozen_string_literal: true

require "stackprof"

def small
  100.times { sleep(0.00000000001) }
end

def medium
  1000.times { sleep(0.00000000001) }
end

def large
  10_000.times { sleep(0.00000000001) }
end

profile = StackProf.run(mode: :wall) do
  100.times do
    small
    medium
    large
  end
end

StackProf::Report.new(profile).print_text
