class BuildingsController < ApplicationController
  def index
    @buildings = Building.all
  end

  def show
    @buildings = Building.all
    @building = @buildings.find(params[:id])
  end
end
