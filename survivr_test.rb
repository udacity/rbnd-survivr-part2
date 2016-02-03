require 'minitest/autorun'
require_relative "survivr"
require_relative "game"
require_relative "tribe"
require_relative "contestant"
require_relative "jury"
require_relative "colorize"

class TestSurvivr < Minitest::Test

  def setup
    #testing game mechanics
    # Create an array of twenty hopefuls to compete on the island of Borneo
    @contestants = %w(walter ed gabe diego juliana johanna juha sofia ben lenora weston dena zach jon seanh seans david ari anthony adriana)
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

  # def test_phase_two
  #   assert_equal 3, phase_two
  # end
  #
  # def test_phase_three
  #   assert_equal 7, phase_three
  # end
end
