require 'tunes_takeout'

class SuggestionsController < ApplicationController
  def index
    @choices = TunesTakeoutWrapper.spotify_search(params[:query], params[:limit])
    if params[:query]
      @choices_hash = @choices["suggestions"]

      @suggestions = []
      @choices_hash.each do |hash_id|
        sugg = {}
        yelp = Food.yelp_find(hash_id["food_id"])
        spotify = Music.spotify_find(hash_id["music_type"], hash_id["music_id"])
        sugg[:suggestion_id] = hash_id["id"]
        sugg[:business_name] = yelp.business.name
        sugg[:business_url] = yelp.business.url
        sugg[:business_image] = yelp.business.image_url
        sugg[:business_rating_image] = yelp.business.rating_img_url
        sugg[:business_phone] = yelp.business.phone
        sugg[:music_name] = spotify.name
        sugg[:music_type] = spotify.type
        sugg[:music_embed] = spotify.uri
        sugg[:music_url] = spotify.external_urls["spotify"]

        if spotify.type == "artist"
          sugg[:music_artist] = nil
        else
          sugg[:music_artist] = spotify.artists[0].name
        end

        if spotify.type == "album"
          sugg[:music_image] = spotify.images[2]["url"]
        elsif spotify.type == "artist"
          sugg[:music_image] = "http://www.shootersconnectionstore.com/App_Themes/SC_Responsive/Images/no-thumbnail-available.png"
        elsif spotify.type == "track"
          sugg[:music_image] = spotify.album.images[2]["url"]
        end

        @suggestions << sugg
      end
    end
  end

end
