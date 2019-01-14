# frozen_string_literal: true

def to_hex(r, g, b)
  [r, g, b].inject('#') do |hex, n|
    raise(ArgumentError, "invalid value: #{n}") if n > 255 || n.negative?

    hex + n.to_s(16).rjust(2, '0')
  end
end

def to_ints(hex)
  raise(ArgumentError, 'invalid format') if hex.match(/\A#\h{6}\z/).nil?

  hex.scan(/\w\w/).map(&:hex)
end
