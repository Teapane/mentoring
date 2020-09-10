require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/dish'

class DishTest < Minitest::Test
  def test_it_sets_the_values
    attrs = {
      name: 'coucous salad',
      category: :appetizer
    }

    dish = Dish.new(attrs)
    assert_equal 'coucous salad', dish.name
    assert_equal :appetizer, dish.category
  end
end
