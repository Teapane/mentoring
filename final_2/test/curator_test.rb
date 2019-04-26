require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/curator'
require './lib/photograph'
require './lib/artist'

class CuratorTest < Minitest::Test
  def test_it_sets_the_values
    assert_equal [], Curator.new.photographs
    assert_equal [], Curator.new.artists
  end

  def test_it_adds_photos
    attrs = {
      id: "1",
      name: "Rue Mouffetard, Paris (Boy with Bottles)",
      artist_id: "4",
      year: "1954"
    }

    photo = Photographer.new(attrs)
    curated = Curator.new.add_photograph(photo)
    assert_equal [photo], curated
  end

  def test_it_adds_artists
    attrs = {
      id: "2",
      name: "Ansel Adams",
      born: "1902",
      died: "1984",
      country: "United States"
    }

    artist = Artist.new(attrs)
    curated = Curator.new.add_artist(artist)
    assert_equal [artist], curated
  end

  def test_it_finds_a_photo
    attrs = {
      id: "1",
      name: "Rue Mouffetard, Paris (Boy with Bottles)",
      artist_id: "4",
      year: "1954"
    }

    photo = Photographer.new(attrs)

    attrs2 = {
      id: "2",
      name: "Girl with pearl earring",
      artist_id: "2",
      year: "1986"
    }

    photo2 = Photographer.new(attrs2)
    curator = Curator.new

    curator.add_photograph(photo)
    curator.add_photograph(photo2)
    assert_equal photo, curator.find_artist_by_id(photo.id)
  end


  def test_it_finds_an_artist
    attrs = {
      id: "2",
      name: "Ansel Adams",
      born: "1902",
      died: "1984",
      country: "United States"
    }

    artist = Artist.new(attrs)

    attrs2 = {
      id: "3",
      name: "Andy Warhol",
      born: "1902",
      died: "1999",
      country: "United States"
    }

    artist2 = Artist.new(attrs2)
    curator = Curator.new

    curator.add_artist(artist)
    curator.add_artist(artist2)
    assert_equal artist, curator.find_photo_by_id(artist.id)
  end
end
