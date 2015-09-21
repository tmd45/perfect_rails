class User < ActiveRecord::Base
  has_many :created_events, class_name: 'Event', foreign_key: :owner_id

  # Find or Create from OmniAuth::AuthHash
  #
  # @param auth_hash [OmniAuth::AuthHash]
  # @return user
  def self.find_or_create_from_auth_hash(auth_hash)
    provider  = auth_hash[:provider]
    uid       = auth_hash[:uid]
    nickname  = auth_hash[:info][:nickname]
    image_url = auth_hash[:info][:image]

    User.find_or_create_by(provider: provider, uid: uid) do |user|
      user.nickname = nickname
      user.image_url = image_url
    end
  end
end
