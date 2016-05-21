class UsersController < ApplicationController
  def index
    @user_favorites = TunesTakeoutWrapper.favorites(current_user.uid)
    @favorites = []
    @user_favorites["suggestions"].each do |user_favorite|
      @favorites << TunesTakeoutWrapper.find_suggest(user_favorite)["suggestion"]
    end
    @your_favorites = []
    @favorites.each do |favorite|
      fave_sugg = {}
      yelp = Food.yelp_find(favorite["food_id"])
      spotify = Music.spotify_find(favorite["music_type"], favorite["music_id"])
      fave_sugg[:suggestion_id] = favorite["id"]
      fave_sugg[:business_name] = yelp.business.name
      fave_sugg[:business_url] = yelp.business.url
      fave_sugg[:business_image] = yelp.business.image_url
      fave_sugg[:business_rating_image] = yelp.business.rating_img_url
      fave_sugg[:business_phone] = yelp.business.phone
      fave_sugg[:music_name] = spotify.name
      fave_sugg[:music_type] = spotify.type
      fave_sugg[:music_embed] = spotify.uri
      fave_sugg[:music_url] = spotify.external_urls["spotify"]

      if spotify.type == "artist"
        fave_sugg[:music_artist] = nil
      else
        fave_sugg[:music_artist] = spotify.artists[0].name
      end

      if spotify.type == "album"
        fave_sugg[:music_image] = spotify.images[2]["url"]
      elsif spotify.type == "artist"
        fave_sugg[:music_image] = "http://www.shootersconnectionstore.com/App_Themes/SC_Responsive/Images/no-thumbnail-available.png"
      elsif spotify.type == "track"
        fave_sugg[:music_image] = spotify.album.images[2]["url"]
      end

      @your_favorites << fave_sugg
    end
  end

  def favorite
    TunesTakeoutWrapper.create_favorites(current_user.uid, params[:suggestion])
    flash[:yay] = "New Favorite Saved!"
    redirect_to users_path
  end

  def destroy
    TunesTakeoutWrapper.delete_favorites(current_user.uid, params[:suggestion])
    flash[:boo] = "Favorite Deleted"
    redirect_to users_path
  end

  def show

  end
end
