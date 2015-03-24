class QueriesController < ApplicationController
  def index
    @house_types = HouseType.all
    @sites = Site.all
    @buildings = Building.all
    @areas = %w(70 80 90)
    @floors = 1..6
  end

  def select_house
    query = {
      house_type: nil,
      site:       nil,
      building:   nil,
      area:       nil,
      floor:      nil,
      door:       nil
    }

    if params[:query]
      query.each do |k, v|
        query[k] = params[:query][k]
      end
    end

    table = Attention.arel_table
    attentions = Attention.where(table[:user_id].eq(current_user[:id]))

    table = House.arel_table
    result = House
    result = result.where(table[:house_type_id].in(query[:house_type])) if query[:house_type]
    result = result.where(table[:floor].in(query[:floor])) if query[:floor]
    result = result.where(table[:building_id].in(query[:building])) if query[:building]
    result = result.where(table[:door].in(query[:door])) if query[:door]
    result = result.take(200)

    house_types = HouseType.all
    buildings = Building.all
    sites = Site.all

    if query[:site]
      result = result.select do |house|
        t = Building.arel_table
        Building.where(t[:id].eq(house[:building_id]).and(t[:site_id].in(query[:site]))).count > 0
      end
    end

    if query[:area]
      result = result.select do |house|
        t = HouseType.arel_table
        HouseType.where(t[:id].eq(house[:house_type_id]).and(t[:area].in(query[:area]))).count > 0
      end
    end

    respond_to do |format|
      format.json {render json: {
          house: result,
          house_type: house_types,
          building: buildings,
          site: sites,
          attention: attentions
        }
      }
    end
  end
end
