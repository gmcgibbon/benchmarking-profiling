# frozen_string_literal: true

require "stackprof"

def small
  100.times { rand }
end

def medium
  1000.times { rand }
end

def large
  10_000.times { rand }
end

profile = StackProf.run(mode: :cpu) do
  100.times do
    small
    medium
    large
  end
end

StackProf::Report.new(profile).print_text
