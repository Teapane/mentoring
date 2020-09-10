require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/photograph'

class PhotographerTest < Minitest::Test
  def test_it_sets_the_values
    attrs = {
      id: "1",
      name: "Rue Mouffetard, Paris (Boy with Bottles)",
      artist_id: "4",
      year: "1954"
    }
    photo = Photographer.new(attrs)

    assert_equal '1', photo.id
    assert_equal "Rue Mouffetard, Paris (Boy with Bottles)", photo.name
    assert_equal "4", photo.artist_id
    assert_equal "1954", photo.year
  end
end
