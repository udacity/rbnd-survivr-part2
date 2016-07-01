class Jury
  attr_accessor :members

  def initialize
    @members = []
  end

  def add_member(member)
    @members.push(member)
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
      #I know this isn't the best practice but, I only have like, 7 colors to choose from, so, if I have more contestants, it's critical to have 7 the most.
      #If I make it so it dynamically chooses colors and prints the contestants, I'll have a big problem if I go over 7, so I'll just have a very limited amount instead :)
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
    winner = final_votes.key(final_votes.values.max)
    print "The winner is..."
    puts "#{winner}".pink if winner == final_votes.keys[0]
    puts "#{winner}".yellow if winner == final_votes.keys[1]
    winner
  end
end
