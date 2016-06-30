class Tribe
  attr_accessor :name, :members

  @@color = 0
  def initialize(options)
    @name = options[:name]
    @members = options[:members]
    puts "="*38
    puts "Tribe #{name} created!".red if @@color == 0
    puts "Tribe #{name} created!".green if @@color == 1
    puts "Tribe #{name} created!".light_blue if @@color == 2
    @@color += 1
  end

  def to_s
    @name
  end

  def tribal_council(options)
    Contestant.new(options[:immune])
  end
end
