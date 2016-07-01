require_relative "game"
require_relative "tribe"
require_relative "contestant"
require_relative "jury"
require 'colorizr'

#After your tests pass, uncomment this code below
#=========================================================
# # Create an array of twenty hopefuls to compete on the island of Borneo
@contestants = %w(carlos walter aparna trinh diego juliana poornima juha sofia julia fernando dena orit colt zhalisa farrin muhammed ari rasha gauri)
@contestants.map!{ |contestant| Contestant.new(contestant) }.shuffle!

# Create two new tribes with names
@coyopa = Tribe.new(name: "Pagong", members: @contestants.shift(10))
@hunapu = Tribe.new(name: "Tagi", members: @contestants.shift(10))
#
# Create a new game of Survivor
@borneo = Game.new(@coyopa, @hunapu)
#=========================================================


#This is where you will write your code for the three phases
def phase_one
  dead = []
  puts "="*38
  8.times do
    losing_tribe = @borneo.immunity_challenge
    rejected = losing_tribe.members.sample
    print "#{rejected}"
    print " "*(14 - rejected.to_s.length)
    puts "[" + "X".red + "]"
    dead.push(rejected)
    losing_tribe.members.delete(rejected)
  end
  dead.length
end

def phase_two
  dead = []
  puts "="*38
  3.times do
    immune = @borneo.individual_immunity_challenge
    rejected = @merge_tribe.tribal_council(immune: immune)
    dead.push(rejected)
    print "#{rejected}"
    print " "*(14 - rejected.to_s.length)
    puts "[" + "X".red + "]"
    @merge_tribe.members.delete(rejected)
  end
  dead.length
end

def phase_three
  puts "="*38
  7.times do
    immune = @borneo.individual_immunity_challenge
    jury_member = @merge_tribe.tribal_council(immune: immune)
    print "#{jury_member}"
    print " "*(14 - jury_member.to_s.length)
    puts "[" + "Added as a jury member".green + "]"
    @jury.add_member(jury_member)
    @merge_tribe.members.delete(jury_member)
  end
  @jury.members.length
end


# If all the tests pass, the code below should run the entire simulation!!
#=========================================================
phase_one #8 eliminations
@merge_tribe = @borneo.merge("Cello") # After 8 eliminations, merge the two tribes together
phase_two #3 more eliminations
@jury = Jury.new
phase_three #7 elminiations become jury members
finalists = @merge_tribe.members #set finalists
print "="*38 + "\n"
vote_results = @jury.cast_votes(finalists) #Jury members report votes
puts "="*38
@jury.report_votes(vote_results) #Jury announces their votes
puts "="*38
@jury.announce_winner(vote_results) #Jury announces final winner
