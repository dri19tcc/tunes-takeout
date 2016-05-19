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
        sugg[:business_name] = yelp.business.name
        sugg[:business_image] = yelp.business.image_url
        sugg[:business_rating_image] = yelp.business.rating_img_url
        sugg[:business_phone] = yelp.business.phone
        sugg[:music_name] = spotify.name
        sugg[:music_type] = hash_id["music_type"]
        # top_sugg[:music_image] = spotify.images[2]["url"]

        @suggestions << sugg
      end
    end
  end

end
