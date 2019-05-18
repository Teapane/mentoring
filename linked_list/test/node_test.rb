require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/node'

class NodeTest < Minitest::Test
  def test_it_sets_the_values
    node = Node.new("Burke")
    assert_equal "Burke", node.surname
    assert_nil(node.next_node)
  end

  def test_it_sets_non_nil_values
    node = Node.new("Burke", 1)
    assert_equal "Burke", node.surname
    assert_equal 1, node.next_node
  end
end
