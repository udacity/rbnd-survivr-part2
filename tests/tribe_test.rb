require 'minitest/autorun'
require_relative "../lib/survivr"
require_relative "../lib/game"
require_relative "../lib/tribe"
require_relative "../lib/contestant"
require_relative "../lib/jury"

class TestTribe < Minitest::Test

  def setup
    @contestants = %w(carlos walter aparna trinh diego juliana poornima juha sofia julia fernando dena orit colt zhalisa farrin muhammed ari rasha gauri)
    @contestants.map!{ |contestant| Contestant.new(contestant) }
    @coyopa = Tribe.new({name: "Pagong", members: @contestants.shift(10)})
    @hunapu = Tribe.new({name: "Tagi", members: @contestants.shift(10)})
  end

  def test_tribe_has_name
    assert_respond_to @coyopa, :name
  end

  # def test_tribe_has_members
  #   assert_respond_to @coyopa, :members
  # end
  #
  # def test_initialize_puts_tribe_creation
  #   contestants = ["person_one", "person_two"]
  #   contestants.map!{ |contestant| Contestant.new(contestant) }
  #   output = capture_io do
  #     Tribe.new({name: "tribe", members: contestants})
  #   end
  #   refute_empty output[0]
  # end
  #
  # def test_tribe_to_s
  #   assert_output(@coyopa.name) {print "#{@coyopa}"}
  # end
  #
  # def test_tribal_council_immune_is_not_voted_off
  #   immune = @coyopa.members.first
  #   immune_array = Array.new(9, immune)
  #   9.times do
  #     result = @coyopa.tribal_council(immune: immune)
  #     p result
  #     if  result.class == Contestant && result != immune
  #       immune_array.pop
  #     end
  #   end
  #   refute_includes immune_array, immune
  # end
  #
  # def test_tribal_council_returns_who_was_voted_off
  #   immune = @coyopa.members.first
  #   assert_instance_of Contestant, @coyopa.tribal_council(immune: immune)
  # end
end
