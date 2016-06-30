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
      print "#{member} voted for"
      print " "*(10 - member.to_s.length)
      print "["
      print "#{vote}".pink if finalists[0] == vote
      print "#{vote}".yellow if finalists[1] == vote
      print "]\n"
    end
    votes
  end

  def report_votes(final_votes)
    count = 0
    final_votes.each do |k,v|
      print "#{k}".pink if count == 0
      print "#{k}".yellow if count == 1
      puts " has #{v} votes!"
      count+=1
    end
  end

  def announce_winner(final_votes)
    val1 = final_votes.values[0]
    val2 = final_votes.values[1]
    val1 > val2 ? (winner = final_votes.keys[0]) : (winner = final_votes.keys[1])
    print "The winner is..."
    puts "#{winner}".pink if winner == final_votes.keys[0]
    puts "#{winner}".yellow if winner == final_votes.keys[1]
    winner
  end
end
