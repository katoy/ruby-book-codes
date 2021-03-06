class GateTest < Minitest::Test
  def test_gate
    umeda = Gate.new(:umeda)
    juso = Gate.new(:juso)

    ticket = Ticket.new(150)
    umeda.enter(ticket)
    assert juso.exit(ticket)
  end
end

# ----------------------------------------

class Gate
  def initialize(name)
    @name = name
  end
end

# ----------------------------------------

class Ticket
  def initialize(fare)
    @fare = fare
  end
end

# ----------------------------------------

require 'minitest/autorun'
require './lib/gate'
require './lib/ticket'

class GateTest < Minitest::Test
  # 省略

# ----------------------------------------

class Gate
  # 省略

  def enter(ticket)
  end

  def exit(ticket)
    true
  end
end
