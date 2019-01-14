# frozen_string_literal: true

UNITS = { m: 1.0, ft: 3.28, in: 39.37 }.freeze

def convert_length(length, from: :m, to: :m)
  raise(ArgumentError, "invalid unit: #{from}") unless UNITS.key?(from)
  raise(ArgumentError, "invalid unit: #{to}") unless UNITS.key?(to)

  (length / UNITS[from] * UNITS[to]).round(2)
end
