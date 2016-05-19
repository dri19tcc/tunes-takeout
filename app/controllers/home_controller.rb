require 'tunes_takeout'

class HomeController < ApplicationController
  skip_before_action :require_login, only: :index

  def index
    # @top_suggestions = TunesTakeoutWrapper.top_suggest
  end
end
