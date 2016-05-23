require 'test_helper'

class MusicTest < ActiveSupport::TestCase
  describe "Music" do
    before do
      @music = Music.spotify_find("")
    end

    it "Knows various attributes", :vcr do
      assert_equal @food.business.name, "India Bistro"
      assert_equal @food.business.phone, "2067835080"
      assert_equal @food.business.url, "http://www.yelp.com/biz/india-bistro-seattle?utm_campaign=yelp_api&utm_medium=api_v2_business&utm_source=DOZfhe1yESBrcYsFC_c53g"
      assert_equal @food.business.image_url, "https://s3-media2.fl.yelpcdn.com/bphoto/zr-A22q08n2GYI1CGW7yBQ/ms.jpg"
      assert_equal @food.business.rating_img_url, "https://s3-media1.fl.yelpcdn.com/assets/2/www/img/5ef3eb3cb162/ico/stars/v1/stars_3_half.png"
    end
  end
end
end
