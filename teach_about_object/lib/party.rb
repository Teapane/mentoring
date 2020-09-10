class Party
  attr_reader :meals, :guests
  def initialize
    @guests = []
    @meals = []
  end

  def add_guests(guests)
    @guests << guests
  end

  def add_meals(meals)
    @meals << meals
  end
end
