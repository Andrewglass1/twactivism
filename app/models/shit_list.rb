class ShitList < ActiveRecord::Base
  attr_accessible :about, :avatar, :title, :politicians, :more
  has_many :shit_list_politicians
  has_many :politicians, :through => :shit_list_politicians

  def self.create_from_params(params)
    politicians = Politician.find(params['ids'])
    title = params['title']
    about = params['about']
    more  = params['more']
    ShitList.create(:about => about, :more => more, :title => title, :politicians => politicians)
  end

  def politician_ids
    politicians.map(&:id).join(",")
  end
end
