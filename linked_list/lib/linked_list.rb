require_relative 'node'
class LinkedList
  attr_reader :head, :tail
  def initialize(head = tail = nil)
    @head = head
    @tail = tail
  end

  def append(arg)
    @head = Node.new(arg)
  end

  def next_node(arg)
    if @head.nil?
      @head
    else
      @head = Node.new(arg)
    end
  end

  def count
    arr = [] << name
    arr.count
  end

  def to_string
    "The #{name} Family"
  end

  private

  def name
    @head.surname
  end
end


#Iteration 1
# > require "./lib/linked_list"
# > list = LinkedList.new
# => <LinkedList @head=nil #45678904567>
# > list.head
# => nil
# > list.append("West")
# => <Node @surname="West" @next_node=nil #5678904567890>
# > list
# > list.head.next_node
# => nil
# > list.count
# => 1
# > list.to_string
# => "The West family"
# > require "./lib/linked_list"
# > list = LinkedList.new
# => <LinkedList @head=nil #45678904567>
# > list.head
# => nil
# > list.append("Rhodes")
# => => <Node @surname="Rhodes" @next_node=nil #5678904567890>
# > list
# => <LinkedList @head=<Node @surname="Rhodes" ... > #45678904567>
# > list.head
# => <Node @surname="Rhodes" @next_node=nil #5678904567890>
# > list.head.next_node
# => nil
# > list.append("Hardy")
# => => <Node @surname="Hardy" @next_node=nil #5678904567890>
# > list.head.next_node
# => <Node @surname="Hardy" @next_node=nil #5678904567890>
# > list.count
# => 2
# > list.to_string
# => "The Rhodes family, followed by the Hardy family"
