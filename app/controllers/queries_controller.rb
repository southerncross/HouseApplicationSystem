class QueriesController < ApplicationController
  def index
    @house_types = HouseType.all
    @sites = Site.all
    @buildings = Building.all
  end
end
