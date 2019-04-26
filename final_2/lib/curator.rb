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
end
