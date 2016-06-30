class Game
  attr_accessor :tribes
  def initialize(tribe1, tribe2)
    @tribes = [tribe1, tribe2]
  end
  def add_tribe(tribe)
    @tribes.push(tribe)
  end
  def immunity_challenge
    Tribe.new(name:"")
  end
  def individual_immunity_challenge
    Contestant.new(name:"")
  end
  def clear_tribes
    @tribes.clear
  end
  def merge(tribe_name)
    new_members = @tribes[0].members + @tribes[1].members
    Tribe.new({name: tribe_name, members: new_members})
  end
end
