require 'pry'
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

  def find_guests_by_name(name)
    guests = @guests.find do |x|
      x.name == name
    end
    guests.name
  end
end
