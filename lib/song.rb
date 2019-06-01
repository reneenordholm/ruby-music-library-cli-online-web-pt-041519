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
    found_song = @@all.find { |song| song.name == song_name } #finds a song by song name, sets it as found_song
    found_song #returns the found song
  end

  def self.find_or_create_by_name(song_name)
    if find_by_name(song_name) #if the song is found
        find_by_name(song_name) #returns song name
    else
      self.create(song_name) #if song is not found, creates a new song and returns it
    end
  end

  def self.new_from_filename(filename)
    #parse the filename
    song_name = filename.split(" - ")[1]
    artist_name = filename.split(" - ")[0]
    genre_name = filename.split(" - ")[2].chomp(".mp3")
    #create song and assign artist and genre attribute, & create connections
    #prevent the creation of duplicate objects: songs, artists, genres
    #song = self.create(song_name)
    song = self.find_or_create_by_name(song_name)
    #song.artist = Artist.create(artist_name)
    song.artist = Artist.find_or_create_by_name(artist_name)
    #song.genre = Genre.create(genre_name)
    song.genre = Genre.find_or_create_by_name(genre_name)
    song
  end

  def self.create_from_filename(filename)
    new_from_filename(filename).save
  end
end
