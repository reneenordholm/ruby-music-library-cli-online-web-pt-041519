class Artist
<<<<<<< HEAD
  extend Concerns::Findable
=======
  extend Findable
>>>>>>> deb727cdc6abf31238124bc1718a962f80417c4f
  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    @@all << self
  end

  def self.create(artist)
    created_artist = Artist.new(artist)
    created_artist.save
    created_artist
  end

  def songs
    @songs
  end

  def add_song(song_to_add)
    song_to_add.artist = self unless song_to_add.artist == self #Song is the artist's unless the song is already the artist's
    @songs << song_to_add unless @songs.include?(song_to_add) #add song the artist's collection unless it is already included in the collection
  end

  def genres
    genres = @songs.map { |song| song.genre } #collects all the genres in the song class
    genres.uniq #returns collection of genres without duplicating
  end
end
