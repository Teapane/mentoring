require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/guests'

class GuestTest < Minitest::Test
  def setup
    attrs = {
      name: "Smith Family",
      count: 4,
      allergies: ["none"]
    }

    @guests = Guests.new(attrs)
  end

  def test_it_sets_the_name
    assert_equal "Smith Family", @guests.name
  end

  def test_it_sets_the_guest_count
    assert_equal ["none"], @guests.allergies
  end

  def test_it_sets_the_guests_allergies
    assert_equal ["none"], @guests.allergies
  end
end

