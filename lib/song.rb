class Song

    attr_accessor :name, :artist
    @@all = []

    def initialize(name)
        @name = name 
        save
    end

    def save
        @@all << self
    end

    def self.all
        @@all 
    end

    def self.new_by_filename(filename)
        # song_artist = filename.split(" - ")[0].strip
        # song_title = filename.split(" - ")[1].strip
        song_artist, song_title = filename.split(" - ")
        song = self.new(song_title)
        song.artist = Artist.find_or_create_by_name(song_artist)
        song
    end

    def artist_name=(name)
        self.artist = Artist.find_or_create_by_name(name)
    end

end