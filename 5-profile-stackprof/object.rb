# frozen_string_literal: true

require "stackprof"

def small
  100.times { Object.new }
end

def medium
  1000.times { Object.new }
end

def large
  10_000.times { Object.new }
end

profile = StackProf.run(mode: :object) do
  100.times do
    small
    medium
    large
  end
end

StackProf::Report.new(profile).print_text
