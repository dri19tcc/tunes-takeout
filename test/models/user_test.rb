require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    # @known = OmniAuth.config.mock_auth[:spotify_known]
    @known = users(:known_user)
    @unknown = users(:unknown_user)
  end

  test "can find an existing user given an oauth spotify hash" do
    @auth_hash = {"info" => {"name" => "Adriana Cannon"}, "provider" => "spotify", "uid" => "dri19tcc"}
    assert_equal @known, User.find_or_create_from_omniauth(@auth_hash)
  end

  test "can make a new user given the oauth spotify hash of an unknown user" do
    @auth_hash = {"info" => {"name" => "Chris Cannon"}, "provider" => "spotify", "uid" => "cannonc"}
    assert_difference 'User.count', 1 do
      @user = User.find_or_create_from_omniauth(@auth_hash)
    end
  end

  test "uses oauth data to set user name, provider and uid for new users" do
    @auth_hash = {"info" => {"name" => "Suzanne Convertino Harrison"}, "provider" => "spotify", "uid" => "1226771573"}
    user = User.find_or_create_from_omniauth(@auth_hash)

    assert_equal @unknown['name'], user.name
    assert_equal @unknown['provider'], user.provider
    assert_equal @unknown['uid'], user.uid
  end
end
