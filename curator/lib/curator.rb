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
    @artists.find { |x| x.id == id }
  end

  def find_photo_by_id(id)
    @photographs.find { |x| x.id == id }
  end

  def find_photographs_by_artist(artist)
    @photographs.inject([]) do |acc, photo|
      acc << photo if photo.artist_id == artist.id
      acc
    end
  end

  def artists_with_multiple_photographs
    @artists.each_with_object([]) do |artist, arr|
      arr << artist unless find_photographs_by_artist(artist).length < 1
    end
  end

  def photographs_taken_by_artist_from(country)
    @artists.inject([]) do |acc, x|
      acc << x unless x.country != country
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

  def photographs_taken_between(range)
    @photographs.reduce([]) do |acc, x|
      acc << x if in_range(range, x)
      acc
    end
  end

  def in_range(range, photo)
    range.include?(photo.year.to_i)
  end

  def artists_photographs_by_age(artist)
    find_photographs_by_artist(artist).inject({}) do |hash, x|
      hash[published_age(x, artist)] = x.name
      hash
    end
  end

  def published_age(photo, artist)
    (photo.year.to_i - artist.born.to_i)
  end
end
