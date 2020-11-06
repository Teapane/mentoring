require 'minitest/autorun'
require 'minitest/pride'
require_relative 'flattener'

class FlattenerTest < MiniTest::Unit::TestCase
  def klass
    Flattener
  end

  def test_it_ignores_non_arrays
    non_arr = "Hi, I am not an array"
    non_arr_2 = {foo: "bar"}
    non_arr_3 = 179
    assert_equal "I shant flatten anything other than an array", Flattener.flatten(non_arr)
    assert_equal "I shant flatten anything other than an array", Flattener.flatten(non_arr_2)
    assert_equal "I shant flatten anything other than an array", Flattener.flatten(non_arr_3)
  end

  def test_empty_array
    arr = []
    new = []
    assert_equal new, Flattener.flatten(arr)
  end

  def test_simple_array
    arr = [1,2,[3]]
    new = [1, 2, 3]
    assert_equal new, Flattener.flatten(arr)
  end

  def test_it_rejects_nils
    arr = [1, 2, [nil, nil], [5, 6, nil]]
    new = [1, 2, 5, 6]
    assert_equal new, Flattener.flatten(arr)
  end

  def test_all_values_in_nested_list_are_nil
    arr = [nil, [[[nil]]], nil, nil, [[nil, nil], nil], nil]
    flat_array = Flattener.flatten(arr)
    assert_equal [], flat_array
  end
end

