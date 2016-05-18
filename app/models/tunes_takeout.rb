require 'httparty'
require 'yelp'
require 'rspotify'

class TunesTakeout
  BASE_URL = "https://tunes-takeout-api.herokuapp.com/"

  def initialize

  end

  # def self.yelp_search(city, query, limit, category = "restaurants")
  #   yelp_params = { term: query,
  #     limit: limit,
  #     category: category
  #   }
  #
  #   Yelp.client.search(city, yelp_params)
  # end

  def self.yelp_find(business)
    Yelp.client.business(business)
  end

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

  def self.connect(query, limit)
    response = HTTParty.get(BASE_URL + "v1/suggestions/search?query=#{query}&limit=#{limit}").parsed_response
    # puts response
    # puts "----------------"
    # puts response[suggestions]

    yelp_business = self.yelp_find(response["suggestions"].first["food_id"])
    spotify_stuff = self.spotify_search(response["suggestions"].first["music_type"], response["suggestions"].first["music_id"])

    puts "yelp: #{yelp_business.business.name} spotify: #{spotify_stuff.name}"
  end
end
