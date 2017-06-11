require 'pry'

class MP3Importer

  attr_accessor :path

  def initialize(filepath)
    @path = filepath
    @files = []
  end

  def files
    @files = Dir.entries(@path).reject {|f| File.directory?(f) || f[0].include?('.')}
  end

  def import
    files.each do |filename|
      Song.new_by_filename(filename)
    end
  end

end
