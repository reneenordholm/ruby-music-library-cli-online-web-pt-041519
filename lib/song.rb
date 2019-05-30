require 'pry'

class Song
  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
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
end
