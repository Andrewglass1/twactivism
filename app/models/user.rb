class User < ActiveRecord::Base
  has_many :tweets

  def self.from_omniauth(auth)
    where(auth.slice("provider", "uid")).first || create_from_omniauth(auth)
  end

  def self.create_from_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["info"]["nickname"]
      user.image = auth["info"]["image"]
      user.token = auth["credentials"]["token"]
      user.secret = auth["credentials"]["secret"]
    end
  end

  def twitter_client
    Twitter::Client.new(
      :oauth_token => token,
      :oauth_token_secret => secret
    )
  end

end
