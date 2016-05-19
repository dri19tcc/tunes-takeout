require 'tunes_takeout'

class HomeController < ApplicationController
  skip_before_action :require_login, only: :index

  def index
    # @top_suggestions = TunesTakeoutWrapper.top_suggest
    # @suggestion_ids = @top_suggestions["suggestions"]
    #
    # @top_ideas = []
    # @suggestion_ids.each do |suggestion_id|
    #   @top_ideas << TunesTakeoutWrapper.find_suggest(suggestion_id)["suggestion"]
    # end
    #
    # @top_favorites = []
    # @top_ideas.each do |top_idea|
    #   top_sugg = {}
    #   yelp = Food.yelp_find(top_idea["food_id"])
    #   spotify = Music.spotify_find(top_idea["music_type"], top_idea["music_id"])
    #   top_sugg[:business_name] = yelp.business.name
    #   top_sugg[:business_image] = yelp.business.image_url
    #   top_sugg[:business_rating_image] = yelp.business.rating_img_url
    #   top_sugg[:business_phone] = yelp.business.phone
    #   top_sugg[:music_name] = spotify.name
    #   top_sugg[:music_type] = top_idea["music_type"]
    #   top_sugg[:music_image] = spotify.images[2]["url"]
    #
    #   @top_favorites << top_sugg
    # end
  end
end
