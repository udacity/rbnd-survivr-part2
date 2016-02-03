require 'minitest/autorun'
require_relative "contestant"


class TestContestant < Minitest::Test
  def setup
    @contestants = %w(walter ed gabe diego juliana johanna juha sofia ben lenora weston dena zach jon seanh seans david ari anthony adriana)
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
