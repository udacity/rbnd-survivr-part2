class Jury
  def initialize
    @members = []
  end
  def add_member(member)
    @members.push(member)
  end
  def members
    @members
  end
  def members=(jury_members)
    @members = jury_members
  end
  def cast_votes(finalists)
    votes = {}
    finalists.each {|finalist| votes[finalist] = 0}
    @members.each do |member|
      vote = finalists.sample
      votes[vote] += 1
      puts "I voted for #{vote}"
    end
    votes
  end
  def report_votes(final_votes)
    final_votes.each do |k,v|
      count = 0
      count+=v
      puts "#{k} has #{count} votes!"
    end
  end
  def announce_winner(final_votes)
    val1 = final_votes.values[0]
    val2 = final_votes.values[1]
    val1 > val2 ? (return final_votes.keys[0]) : (return final_votes.keys[1])
  end
end
