OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, ENV['ANDY_TWITTER_KEY'], ENV['ANDY_TWITTER_SECRET']
end