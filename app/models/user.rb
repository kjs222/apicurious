class User < ActiveRecord::Base

  def self.from_omniauth(auth_info)
    where(uid: auth_info['uid']).first_or_create do |user|
      user.uid = auth_info["uid"]
      user.name = auth_info["info"]["name"]
      user.token = auth_info["credentials"]["token"]
      user.nickname = auth_info["info"]["nickname"]
    end
  end

end
