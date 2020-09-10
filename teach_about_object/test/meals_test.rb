require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/meals'

class MealsTest < Minitest::Test
  def setup
    attrs = {
      appetizers: ["oysters", "caviar"],
      entrees: ["vegan meatballs", "steak"],
      drinks: ["apple cider", "highly hopped craft beer", "la croix"]
    }
    @meals = Meals.new(attrs)

  end

  def test_it_sets_the_appetizers
    assert_equal ["oysters", "caviar"], @meals.appetizers
  end

  def test_it_sets_the_entrees
    assert_equal ["oysters", "caviar"], @meals.appetizers
  end

  def test_it_sets_the_drinks
    assert_equal ["apple cider", "highly hopped craft beer", "la croix"], @meals.drinks
  end
end


