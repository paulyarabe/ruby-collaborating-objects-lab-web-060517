require 'pry'

class Song

  attr_accessor :name, :artist

  def initialize(name)
    @name = name
  end

  def self.new_by_filename(file_name)
    mp3_array = file_name.split(" - ")
    new_song = Song.new(mp3_array[1])
    new_artist = Artist.find_or_create_by_name(mp3_array[0])
    new_song.artist = new_artist
    Artist.all.last.songs << new_song
    new_song
  end

end
