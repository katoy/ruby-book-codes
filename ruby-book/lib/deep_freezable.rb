# frozen_string_literal: true

module DeepFreezable
  def deep_freeze(array_or_hash)
    case array_or_hash
    when Array
      array_or_hash.each { |x| deep_freeze(x) }
    when Hash
      deep_freeze(array_or_hash.keys)
      deep_freeze(array_or_hash.values)
    end

    array_or_hash.freeze
  end
end
