class User < ActiveRecord::Base

  def self.from_omniauth(auth_info)
    where(uid: auth_info['uid']).first_or_create do |user|
      user.uid = auth_info["uid"]
      user.name = auth_info["info"]["name"]
      user.token = auth_info["credentials"]["token"]
      user.nickname = auth_info["info"]["nickname"]
      user.image = auth_info["info"]["image"]
      user.email = auth_info["info"]["email"]
    end
  end

end
