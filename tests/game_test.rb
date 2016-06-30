require 'minitest/autorun'
require_relative "../lib/game"
require_relative "../lib/tribe"
require_relative "../lib/contestant"

class TestGame < Minitest::Test

  def setup
    @contestants = %w(carlos walter aparna trinh diego juliana poornima juha sofia julia fernando dena orit colt zhalisa farrin muhammed ari rasha gauri)
    @contestants.map!{ |contestant| Contestant.new(contestant) }
    @coyopa = Tribe.new({name: "Pagong", members: @contestants.shift(10)})
    @hunapu = Tribe.new({name: "Tagi", members: @contestants.shift(10)})
    @borneo = Game.new(@coyopa, @hunapu)
  end

  def test_game_has_tribes
    assert_respond_to @borneo, :tribes
  end

  def test_tribes_is_array
    assert_kind_of Array, @borneo.tribes
  end

  def test_add_tribe
    contestants = ["person_one", "person_two"]
    contestants.map!{ |contestant| Contestant.new(contestant) }
    tribe_three = Tribe.new({name: "tribe", members: contestants})
    assert_equal 3, @borneo.add_tribe(tribe_three).length
  end

  def test_immunity_challenge
    assert_instance_of Tribe, @borneo.immunity_challenge
  end

  def test_clear_tribes
    assert_empty @borneo.clear_tribes
  end

  def test_merge_returns_new_tribe
    assert_instance_of Tribe, @borneo.merge("combined_tribe")
  end

  def test_merge_includes_one_of_first_tribe
    included = []
    new_tribe = @borneo.merge("combined_tribe")
    @coyopa.members.each do |contestant|
      new_tribe.members.include?(contestant) ? included << true : included << false
    end
    assert included.include?(true)
  end

  def test_merge_includes_one_of_second_tribe
    included = []
    new_tribe = @borneo.merge("combined_tribe")
    @hunapu.members.each do |contestant|
      new_tribe.members.include?(contestant) ? included << true : included << false
    end
    assert included.include?(true)
  end

  def test_individual_immunity_challenge
    assert_instance_of Contestant, @borneo.individual_immunity_challenge
  end
end
