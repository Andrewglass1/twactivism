class ShitListsController < ApplicationController

  def create
    @shitlist = ShitList.create_from_params(params["shit_list"])
    render :json => {title: @shitlist.title, id: @shitlist.id, poli_ids: @shitlist.politician_ids}
  end
  
end
