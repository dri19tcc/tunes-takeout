class UsersController < ApplicationController
  def index
    # @user_favorites = TunesTakeoutWrapper.favorites(current_user.uid)
  end

  def favorite
    TunesTakeoutWrapper.create_favorites(current_user.uid, params[:suggestion])
  end

  def show

  end
end
