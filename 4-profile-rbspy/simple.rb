# frozen_string_literal: true

def say
  `say #{yield}` # NOTE: say is an mac-only command
end

def hello(subject)
  sleep(0.2)
  "Hello #{subject}"
end

def start
  say { hello "World" }
end

start
