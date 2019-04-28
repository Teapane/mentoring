require 'csv'
class Curator
  attr_reader :photographs, :artists

  def initialize
    @photographs = []
    @artists     = []
  end

  def add_photograph(photo)
    @photographs << photo
  end

  def add_artist(artist)
    @artists << artist
  end

  def find_artist_by_id(id)
    @photographs.find { |x| x.id == id }
  end

  def find_photo_by_id(id)
    @artists.find { |x| x.id == id }
  end

  def find_photographs_by_artist(artist)
    @photographs.inject([]) do |acc, photo|
      if photo.artist_id == artist.id
        acc << photo
      end
      acc
    end
  end

  def artists_with_multiple_photographs
    @artists.each_with_object([]) do |artist, arr|
      if find_photographs_by_artist(artist).length > 1
        arr << artist
      end
    end
  end

  def photographs_taken_by_artist_from(country)
    @artists.inject([]) do |acc, x|
      if x.country == country
        acc << x
      end
      acc
    end
  end

  def load_data(file)
    CSV.open(file, headers: :first_row).map(&:to_h)
  end

  def load_photographs(file)
    data = load_data(file)
    data.each { |x| add_photograph(x) }
  end

  def load_artists(file)
    data = load_data(file)
    data.each { |x| add_artist(x) }
  end
end
