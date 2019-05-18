require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/node'
require './lib/linked_list'

class LinkedListTest < Minitest::Test
  def test_it_initialize_with_nil_reference
    li = LinkedList.new
    assert_equal nil, li.head
  end

  def test_it_references_head_as_node
    li = LinkedList.new
    li.append("West")
    assert_instance_of Node, li.head
    assert_nil(li.head.next_node)
  end

  def test_next_node
    li = LinkedList.new
    li.append("East")
    li.next_node(nil)
    assert_nil(li.head.surname)
  end

  def test_counts
    li = LinkedList.new
    li.append("North")
    count = li.count
    assert_equal 1, count
  end

  def test_name
    li = LinkedList.new
    li.append("South")
    assert_equal "The South Family", li.to_string
  end
end
