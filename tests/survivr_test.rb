require 'minitest/autorun'
require_relative "../lib/survivr"
require_relative "../lib/game"
require_relative "../lib/tribe"
require_relative "../lib/contestant"
require_relative "../lib/jury"

class TestSurvivr < Minitest::Test

  def setup
    #testing game mechanics
    # Create an array of twenty hopefuls to compete on the island of Borneo
    @contestants = %w(carlos walter aparna trinh diego juliana poornima juha sofia julia fernando dena orit colt zhalisa farrin muhammed ari rasha gauri)
    @contestants.map!{ |contestant| Contestant.new(contestant) }.shuffle!

    # Create two new tribes with names
    @coyopa = Tribe.new(name: "Pagong", members: @contestants.shift(10))
    @hunapu = Tribe.new(name: "Tagi", members: @contestants.shift(10))

    # Create a new game of Survivor
    @borneo = Game.new(@coyopa, @hunapu)
    @merge_tribe = @borneo.merge("Cello")
    @jury = Jury.new
  end

  def test_phase_one
    assert_equal 8, phase_one
  end

  def test_phase_two
    assert_equal 3, phase_two
  end
  
  def test_phase_three
    assert_equal 7, phase_three
  end
end
