class User < ActiveRecord::Base
  validates :name, :uid, :provider, presence: true

  def self.find_or_create_from_omniauth(auth_hash)
    user = self.find_by(uid: auth_hash["uid"], provider: auth_hash["provider"])
    if !user.nil?
      return user
    else
      user = User.new
      user.uid = auth_hash["uid"]
      user.provider = auth_hash["provider"]
      user.name = auth_hash["info"]["name"]
      user.image_url = auth_hash["info"]["image"]
      # user.email = auth_hash["info"]["email"]

      if user.save
        return user
      else
        return nil
      end

    end
  end

  def self.connect(query, limit)
    response = HTTParty.get(BASE_URL + "v1/suggestions/search?query=#{query}&limit=#{limit}").parsed_response

    yelp_business = self.yelp_find(response["suggestions"].first["food_id"])
    spotify_stuff = self.spotify_search(response["suggestions"].first["music_type"], response["suggestions"].first["music_id"])

    puts "yelp: #{yelp_business.business.name} spotify: #{spotify_stuff.name}"
  end

  def self.suggestions(suggest)
    response = HTTParty.get(BASE_URL + "v1/suggestions/#{suggest}").parsed_response

  end
end
