require 'tunes_takeout'

class HomeController < ApplicationController
  skip_before_action :require_login, only: :index

  def index
    @top_suggestions = TunesTakeoutWrapper.top_suggest
    @suggestion_ids = @top_suggestions["suggestions"]

    @top_array = []
    @suggestion_ids.each do |suggestion_id|
      @top_array << TunesTakeoutWrapper.find_suggest(suggestion_id)["suggestion"]
    end
    raise
  end
end
