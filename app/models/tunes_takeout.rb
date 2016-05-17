require 'httparty'
require 'yelp'
require 'rspotify'

class TunesTakeout
  BASE_URL = "https://tunes-takeout-api.herokuapp.com/"

  def initialize
    Yelp.client.configure do |config|
      config.consumer_key = "DOZfhe1yESBrcYsFC_c53g"
      config.consumer_secret = 	"wTESBjwnK7KqEUBnDH0glaoeGfg"
      config.token = "UIlA5f8p0Y320Sv2kL6cpGU3-Qqf6lmC"
      config.token_secret = "gvKsdHl7c_RfpJk16tb_NzL5Kwc"
    end
  end

  def self.yelp_search(city, query, limit, category = "restaurants")
    yelp_params = { term: query,
      limit: limit,
      category: category
    }

    Yelp.client.search(city, yelp_params)
  end

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
    response = HTTParty.get(BASE_URL + "/v1/suggestions/search?query=#{query}&limit=#{limit}").parsed_response
    # puts response
    # puts "----------------"
    # puts response[suggestions]

    yelp_business = self.yelp_find(response["suggestions"].first["food_id"])
    spotify_stuff = self.spotify_search(response["suggestions"].first["music_type"], response["suggestions"].first["music_id"])

    puts "yelp: #{yelp_business.business.name} spotify: #{spotify_stuff.name}"
  end
end



# class Pokemon
#   BASE_URL = "http://pokeapi.co/api/v2/"
#   attr_reader :name, :moves, :sprites
#
#   def initialize(data)
#     @name = data["name"]
#     @moves = data["moves"]
#     @sprites = reject_null_sprites(data["sprites"])
#   end
#
#   def sprite_urls
#     sprites.values
#   end
#
#   def favorite_move
#     HTTParty.get(moves.sample["move"]["url"]).parsed_response
#   end
#
#   def self.find(id)
#     # http://pokeapi.co/api/v2/pokemon/25/ example we want to hit
#     # find a pokemon with the passed id
#     data = HTTParty.get(BASE_URL + "pokemon/#{id}/").parsed_response
#
#     # return an instance of pokemon for that id
#     self.new(data)
#   end
#
#   def reject_null_sprites(sprite_hash)
#     sprite_hash.reject do |name, url|
#       url.nil?
#     end
#   end
# end
