require "./lib/exhibit"
require "./lib/patron"

class Museum
  attr_reader :name, :exhibits, :patrons

  def initialize(name)
    @name = name
    @exhibits = []
    @patrons = []
  end

  def add_exhibit(exhibit)
    @exhibits << exhibit
  end

  def recommend_exhibits(patron)
    @exhibits.find_all do |exhibit|
      patron.interests.include?(exhibit.name)
    end
  end

  def admit(patron)
    @patrons << patron
  end

  def patrons_by_exhibit_interest
    @exhibits.reduce(Hash.new(Array.new)) do |results, exhibit|
      results[exhibit] = @patrons.find_all {|patron| patron.interests.include?(exhibit.name)}
      results
    end
  end

  def ticket_lottery_contestants(exhibit)
    @patrons.find_all do |patron|
      patron.interests.include?(exhibit.name) && patron.spending_money < exhibit.cost
    end
  end

  def draw_lottery_winner(exhibit)
    pool = ticket_lottery_contestants(exhibit)
    if pool.empty?
      nil
    elsif pool.count == 1
      pool[0].name
    else
      pool.sample.name
    end
  end

end
