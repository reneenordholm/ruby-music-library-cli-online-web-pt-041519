class Artist
  attr_accessor :name, :song

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

  def add_song(song) #assigns the current artist to the song's 'artist' property (song belongs to artist)
    #when artist class is called add the current song to the artist's song bank

  end
end
