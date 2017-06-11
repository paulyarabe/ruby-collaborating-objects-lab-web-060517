require 'pry'

class Artist
  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
    self.save
  end

  def add_song(song)
    @songs << song
    song.artist = self
  end

  def songs
    @songs
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  # returns the artist if its name attributes matches name provided
  def self.find_by_name(name)
    self.all.select do |artist|
        artist.name == name
    end[0]
  end

  # make new artist unless he already exists
  def self.find_or_create_by_name(name)
    Artist.new(name) unless find_by_name(name)
  end

  def print_songs
    @songs.each {|song| puts song.name}
  end

end
