require 'pry'

class Song
  attr_accessor :name
  attr_reader :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist #invokes #artist= instead of simply assigning to an @artist instance variable, ensuring that associations are creted upon initialization
    self.genre = genre
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

  def self.create(song)
    created_song = Song.new(song) #song is identified as variable created_song
    created_song.save #save new instance of song
    created_song #return song
  end

  def artist=(artist)
    #if no variabe given for
    #assigns artist instance
    #if artist is defined, then..
    @artist == nil ? @artist = artist : @artist = @artist
      #so long as artist is not nil, add the song to the artist's collection of songs
      if self.artist != nil
        @artist.add_song(self)
      end
    @artist #return status of artist
  end

  def genre=(genre)
    @genre == nil ? @genre = genre : @genre = @genre
    if self.genre != nil
        @genre.add_song(self)
    end
    @genre
  end

  def self.find_by_name(song_name)
    found_song = @@all.find { |song| song.name == song_name }
    found_song
  end

  def self.find_or_create_by_name(song_name)
    find_by_name(found_song)
    if song == nil
      song = Song.new(song_name)
  end
end
