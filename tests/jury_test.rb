require 'minitest/autorun'
require_relative "../lib/contestant"
require_relative "../lib/jury"

class TestJury < Minitest::Test

  def setup
    @jury_members = %w(carlos walter aparna trinh diego juliana poornima)
    @jury_members.map!{ |member| Contestant.new(member) }
    @finalists = %w(orit colt)
    @finalists.map!{ |member| Contestant.new(member) }
    @jury = Jury.new
  end

  def test_add_members_to_jury
    @jury.add_member(@jury_members.first)
    assert_includes @jury.members, @jury_members.first
  end

  #=====Remember to uncomment one test method at a time.=====

  def test_jury_starts_as_empty_array
    jury = Jury.new
    assert_empty jury.members
  end

  def test_cast_votes_returns_hash
    assert_kind_of Hash, @jury.cast_votes(@finalists)
  end

  def test_cast_votes_hash_includes_two_finalists
    @jury.members = @jury_members
    assert_equal 2, @jury.cast_votes(@finalists).length
  end

  def test_cast_votes_every_member_vote_puts_to_terminal
    @jury.members = @jury_members
    output = capture_io do
      @jury.cast_votes(@finalists)
    end
    output = output[0].split("\n").length
    assert_equal 7, output
  end

  def test_cast_votes_total_votes_equals_seven
    total_votes = 0
    @jury.members = @jury_members
    @jury.cast_votes(@finalists).each {|k,v| total_votes += v}
    assert_equal 7, total_votes
  end

  def test_cast_votes_voting_seems_random
    #not an actual test, but make sure the votes each jury member casts is random. hint: TestContestant has a method that will randomly select an item from an array.
  end

  def test_report_votes_puts_score_for_each_finalist
    @jury.members = @jury_members
    final_votes = @jury.cast_votes(@finalists)
    output = capture_io do
      @jury.report_votes(final_votes)
    end
    assert_equal 2, output[0].split("\n").length
  end

  def test_announce_winner
    final_votes = {@finalists.first => 4, @finalists.last => 3}
    assert_equal @finalists.first, @jury.announce_winner(final_votes)
  end
end
