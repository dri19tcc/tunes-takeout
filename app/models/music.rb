require 'rspotify'

class Music #< ActiveRecord::Base
  def self.spotify_find(type, id)
    if type == "album"
      RSpotify::Album.find(id)
    elsif type == "artist"
      RSpotify::Artist.find(id)
    elsif type == "track"
      RSpotify::Track.find(id)
    end
  end
end
