class Politician < ActiveRecord::Base
  attr_accessible :handle, :name, :party, :state, :avatar
  has_many :tweets
  
  has_many :shit_list_politicians
  has_many :shit_lists, :through => :shit_list_politicians
end
