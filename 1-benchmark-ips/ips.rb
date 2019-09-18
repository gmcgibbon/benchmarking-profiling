# frozen_string_literal: true

require "benchmark/ips"
require "erb"
require "pathname"

class Context
  def initialize(locals)
    locals.each do |name, value|
      instance_variable_set("@#{name}", value)
    end
  end

  def binding
    super
  end
end

def render(name, locals = {})
  template = Pathname.new(__dir__).join("views", name).read
  context  = Context.new(locals)
  ERB.new(template).result(context.binding)
end

Benchmark.ips do |x|
  x.report("render") do
    render("normal.txt.erb")
  end
  x.report("render with interpolations") do
    render("interpolated.txt.erb", user: "Gannon",
                                   year: Time.now.year,
                                   day: Time.now.strftime("%A"),
                                   status: :expired)
  end

  x.compare!
end
