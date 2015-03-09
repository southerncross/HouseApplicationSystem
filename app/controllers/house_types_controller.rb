class HouseTypesController < ApplicationController
  def index
    @house_types = HouseType.all
  end

  def show
    @house_type = HouseType.find(params[:id])
  end
end
