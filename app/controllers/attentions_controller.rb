# -*- coding: utf-8 -*-
class AttentionsController < ApplicationController
  def index
    user_id = current_user.id
    table = Attention.arel_table
    attentions = Attention.where(table[:user_id].eq(user_id))
    table = House.arel_table
    @houses = []
    attentions.each do |attention|
      @houses << House.where(table[:id].eq(attention[:house_id]))[0]
    end
    @house_types = array_to_hash(HouseType.all)
    @buildings = array_to_hash(Building.all)
    @sites = array_to_hash(Site.all)
  end

  def destroy
    house_id = params[:house_id]
    user_id = params[:user_id]
    table = Attention.arel_table
    Attention.where(table[:house_id].eq(house_id).and(table[:user_id].eq(user_id))).destroy_all

    respond_to do |format|
      format.json {render json: {ret: 0}}
    end
  end

  # FIXME: This method is deprecated
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

  private

  def array_to_hash(a)
    h = {}
    a.each do |i|
      h[i.id] = i
    end
    h
  end
end
