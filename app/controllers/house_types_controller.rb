class HouseTypesController < ApplicationController
  def index
    @house_types = HouseType.all
  end

  def show
    @house_types = HouseType.all
    @house_type = @house_types.find(params[:id])
  end
end
