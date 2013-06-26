class Tweet < ActiveRecord::Base
  attr_accessible :user_id, :recipient, :sent_at, :content, :politician_id

  belongs_to :user
  belongs_to :politician

  after_create :transmit

  def transmit
    Thread.new{user.twitter_client.update(written_tweet)}
    update_attribute(:sent_at, DateTime.now)
  end

private

  def written_tweet
    content.gsub("<<recipient>>", recipient)
  end
end
