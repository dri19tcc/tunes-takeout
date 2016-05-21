require 'httparty'
# require 'yelp'
# require 'rspotify'

module TunesTakeoutWrapper
  BASE_URL = "https://tunes-takeout-api.herokuapp.com/"

  def self.spotify_search(query, limit = 10)
    HTTParty.get(BASE_URL + "v1/suggestions/search?query=#{query}&limit=#{limit}").parsed_response
  end

  def self.favorites(user_id)
    HTTParty.get(BASE_URL + "/v1/users/#{user_id}/favorites").parsed_response
  end

  def self.create_favorites(user_id, suggestion_id)
    response = HTTParty.post(BASE_URL + "/v1/users/#{user_id}/favorites", :body => { :suggestion => suggestion_id }.to_json, :headers => { 'Content-Type' => 'application/json' })
    return response
  end

  def self.delete_favorites(user_id, suggestion_id)
    response = HTTParty.delete(BASE_URL + "/v1/users/#{user_id}/favorites", :body => { :suggestion => suggestion_id }.to_json, :headers => { 'Content-Type' => 'application/json' })
    return response
  end

  def self.top_suggest(limit = 10)
    HTTParty.get(BASE_URL + "v1/suggestions/top?limit=#{limit}").parsed_response
  end

  def self.find_suggest(suggestion_id)
    HTTParty.get(BASE_URL + "v1/suggestions/#{suggestion_id}").parsed_response
  end
end
