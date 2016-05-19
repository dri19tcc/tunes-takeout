require 'tunes_takeout'

class HomeController < ApplicationController
  skip_before_action :require_login, only: :index

  def index
    
  end
end
