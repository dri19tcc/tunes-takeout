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
      # user.email = auth_hash["info"]["email"]

      if user.save
        return user
      else
        return nil
      end

    end
    # @user = User.find_by_uid_and_provider(auth_hash["uid"], auth_hash["provider"])
    #no user found do something here
    # Find or create a user
    # user = //something else here//
    # if !user.nil?
    #   return user that was found
    # else
    #   no user found, do something here
    # end
  end
end
