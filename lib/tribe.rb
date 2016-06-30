class Tribe
  attr_accessor :name, :members
  def initialize(options)
    @name = options[:name]
    @members = options[:members]
    puts "Tribe #{name} created!"
  end
  def to_s
    @name
  end
  def tribal_council(options)
    Contestant.new(options[:immune])
  end
end
