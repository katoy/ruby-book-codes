# frozen_string_literal: true

module Effects
  def self.reverse
    ->(x) { x.split(' ').map(&:reverse).join(' ') }
  end

  def self.echo(rate)
    lambda do |x|
      if rate < 1
        ''
      else
        x.chars.map { |c| c == ' ' ? c : c * rate }.join
      end
    end
  end

  def self.loud(level)
    lambda do |x|
      if level.negative?
        ''
      else
        x.split(' ').map { |word| word.upcase + '!' * level }.join(' ')
      end
    end
  end
end
