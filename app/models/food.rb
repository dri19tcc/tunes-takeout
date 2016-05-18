class Food < ActiveRecord::Base
  def self.yelp_find(business)
    Yelp.client.business(business)
  end
end
