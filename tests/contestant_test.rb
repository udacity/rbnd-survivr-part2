require 'minitest/autorun'
require_relative "../lib/contestant"


class TestContestant < Minitest::Test
  def setup
    @contestants = %w(carlos walter aparna trinh diego juliana poornima juha sofia julia fernando dena orit colt zhalisa farrin muhammed ari rasha gauri)
    @contestants.map!{ |contestant| Contestant.new(contestant) }.shuffle!
  end

  def test_contestant_has_name
    assert_respond_to @contestants.sample, :name
  end

  # def test_contestant_to_s
  #   contestant = @contestants.sample
  #   assert_output(contestant.name) {print "#{contestant}"}
  # end
end
