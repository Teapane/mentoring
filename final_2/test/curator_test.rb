require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/curator'
require './lib/photograph'
require './lib/artist'

class CuratorTest < Minitest::Test
  def setup
    @attrs_photo = {
      id: "1",
      name: "Rue Mouffetard, Paris (Boy with Bottles)",
      artist_id: "4",
      year: "1954"
    }
    @photo = Photographer.new(@attrs_photo)

    @attrs_photo2= {
      id: "2",
      name: "Girl with pearl earring",
      artist_id: "2",
      year: "1986"
    }

    @photo2 = Photographer.new(@attrs_photo2)

    @attrs_photo3= {
      id: "3",
      name: "Starry Night",
      artist_id: "2",
      year: "1986"
    }

    @photo3 = Photographer.new(@attrs_photo3)

    @attrs_artist= {
      id: "2",
      name: "Ansel Adams",
      born: "1902",
      died: "1984",
      country: "United States"
    }

    @artist = Artist.new(@attrs_artist)

    @attrs_artist2= {
      id: "3",
      name: "Andy Warhol",
      born: "1902",
      died: "1999",
      country: "France"
    }

    @artist2 = Artist.new(@attrs_artist2)

    @curator = Curator.new
  end

  def test_it_sets_the_values
    assert_equal [], @curator.photographs
    assert_equal [], @curator.artists
  end

  def test_it_adds_photos
    curated = @curator.add_photograph(@photo)
    assert_equal [@photo], curated
  end

  def test_it_adds_artists
    curated = @curator.add_artist(@artist)
    assert_equal [@artist], curated
  end

  def test_it_finds_a_photo
    @curator.add_photograph(@photo)
    @curator.add_photograph(@photo2)
    assert_equal @photo, @curator.find_artist_by_id(@photo.id)
  end

  def test_it_finds_an_artist
    @curator.add_artist(@artist)
    @curator.add_artist(@artist2)
    assert_equal @artist, @curator.find_photo_by_id(@artist.id)
  end

  def test_it_finds_photographs_by_artist
    @curator.add_photograph(@photo)
    @curator.add_photograph(@photo2)
    @curator.add_photograph(@photo3)
    assert_equal [@photo2, @photo3], @curator.find_photographs_by_artist(@artist)
  end

  def test_artist_with_multiple_photographs
    @curator.add_artist(@artist)
    @curator.add_artist(@artist2)
    @curator.add_photograph(@photo)
    @curator.add_photograph(@photo2)
    @curator.add_photograph(@photo3)
    assert_equal [@artist], @curator.artists_with_multiple_photographs
  end

  def test_photographs_taken_by_artist_from
    @curator.add_artist(@artist)
    @curator.add_artist(@artist2)
    @curator.add_photograph(@photo)
    @curator.add_photograph(@photo2)
    @curator.add_photograph(@photo3)
    assert_equal [@artist], @curator.photographs_taken_by_artist_from(@artist.country)
  end

  def test_photographs_taken_by_artist_from_returns_nil
    @curator.add_artist(@artist)
    @curator.add_artist(@artist2)
    @curator.add_photograph(@photo)
    @curator.add_photograph(@photo2)
    @curator.add_photograph(@photo3)
    assert_equal [], @curator.photographs_taken_by_artist_from("Hungary")
  end

  def test_it_loads_photos_csv
    file = './data/photographs.csv'
    data = @curator.load_photographs(file)
    assert_equal 4, data.length
    assert_equal 4, @curator.photographs.length
  end

  def test_it_loads_artists_csv
    file = './data/artists.csv'
    data = @curator.load_artists(file)
    assert_equal 6, data.length
    assert_equal 6, @curator.artists.length
  end
end
