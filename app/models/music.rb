class Music < ActiveRecord::Base
  def self.spotify_search(type, id)
    if type == "album"
      RSpotify::Album.find(id)
    elsif type == "artist"
      RSpotify::Artist.find(id)
    elsif type == "track"
      RSpotify::Track.find(id)
    elsif type == "playlist"
      RSpotify::Playlist.find(id)
    end
  end
end
