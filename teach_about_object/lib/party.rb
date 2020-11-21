class Party
  attr_reader :guests, :meals

  def initialize(args={})
    @guests = []
    @meals = []
  end

  def add_guests(guests)
    @guests << guests
  end

  def add_meals(meals)
    @meals << meals
  end

  def find_guests_by_name(name)
    family = @guests.find { |x| x.name == name }
    family.name
  end
end
