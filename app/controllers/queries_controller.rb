class QueriesController < ApplicationController
  def index
    @house_types = HouseType.all
    @sites = Site.all
    @buildings = Building.all
    @areas = %w(70 80 90)
    @floors = 1..6
  end

  def select_house
    house_type_ids = params[:query]? params[:query][:house_type] : nil
    site_ids = params[:query]? params[:query][:site] : nil
    areas = params[:query]? params[:query][:area] : nil
    floors = params[:query]? params[:query][:floor] : nil

    house_arel = House.arel;
    house_type = house_type_ids ? house_arel[:house_type_id].eq(house_type_ids) : nil

    respond_to do |format|
      format.json {render json: {
          house_type_ids: house_type_ids,
          site_ids: site_ids,
          areas: areas,
          floors: floors
        }}
    end
  end
end
