class MusicLibraryController

  def initialize(path = "./db/mp3s")
    object = MusicImporter.new(path)
    object.import
  end
end
