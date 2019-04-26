require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/artist'

class ArtistTest < Minitest::Test
  def test_it_sets_the_values
    attrs = {
      id: "2",
      name: "Ansel Adams",
      born: "1902",
      died: "1984",
      country: "United States"
    }

    artist = Artist.new(attrs)
    assert_equal '2', artist.id
    assert_equal "Ansel Adams", artist.name
    assert_equal "1902", artist.born
    assert_equal "1984", artist.died
    assert_equal "United States", artist.country
  end
end
