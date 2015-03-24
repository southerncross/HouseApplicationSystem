class AttentionsController < ApplicationController
  def index
  end

  def query
    user_id = params[:query][:user_id]
    table = Attention.arel_table
    attentions = Attention.where(table[:user_id].eq(user_id))
    table = House.arel_table
    houses = []
    attentions.each do |attention|
      houses << House.where(table[:id].eq(attention[:house_id]))[0]
    end
    house_types = HouseType.all
    buildings = Building.all
    sites = Site.all

    respond_to do |format|
      format.json {render json: {
          house: houses,
          house_type: house_types,
          building: buildings,
          site: sites
        }
      }
    end
  end
end
