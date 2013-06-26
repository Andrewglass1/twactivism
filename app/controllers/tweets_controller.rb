class TweetsController < ApplicationController

  def create
    content = params["content"]
    politicians = Politician.find(params["poli_ids"].reject(&:empty?))

    politicians.each do |politician|
      current_user.tweets.create(:recipient => politician.handle, :content => content, :politician_id => politician.id)
    end
    render :json => {}
  end

  # def new
  #   #TODO create a tweet for each param the user sends.  this should
  #   #create a tweets for each recipient
  #   recipients = ["1","2","3"]

  #   recipients.each do |recipient|
  #     current_user.tweets.create(:recipient => recipient, :content => params['content'], :politician_id => Politician.first.id)
  #   end
    
  #   redirect_to root_path
  # end
end
