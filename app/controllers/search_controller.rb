class SearchController < ApplicationController

  def index
    @facade = SearchFacade.new(params[:keyword])
  end
end