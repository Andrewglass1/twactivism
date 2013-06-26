class ShitListPolitician < ActiveRecord::Base
  attr_accessible :politician_id, :shit_list_id

  belongs_to :politician
  belongs_to :shit_list

end
