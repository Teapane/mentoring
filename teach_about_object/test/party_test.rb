require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/party'
require './lib/guests'
require './lib/meals'

class PartyTest < Minitest::Test
  def setup
    meals_attrs = {
      appetizers: ["oysters", "caviar"],
      entrees: ["vegan meatballs", "steak"],
      drinks: ["apple cider", "highly hopped craft beer", "la croix"]
    }
    @meals = Meals.new(meals_attrs)

    guest_attrs = {
      name: "Smith Family",
      count: 4,
      allergies: ["none"]
    }

    @guests = Guests.new(guest_attrs)

    @party = Party.new
  end

  def test_it_sets_the_values_as_empty
    assert_equal [], @party.guests
    assert_equal [], @party.meals
  end

  def test_it_adds_a_family_to_the_party
    guests = @party.add_guests(@guests)
    assert_equal [@guests], guests
  end

  def test_it_adds_a_menu_to_a_party
    meals = @party.add_meals(@meals)
    assert_equal [@meals], meals
  end

  def test_the_party
    meals = @party.add_meals(@meals)
    guests = @party.add_guests(@guests)
    assert_equal [@meals], meals
    assert_equal [@guests], guests
  end

  def test_the_guest_count
    guests = @party.add_guests(@guests)
    assert_equal 4, guests.count
  end
end


