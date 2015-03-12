class SitesController < ApplicationController
  def index
     @sites = Site.all
  end

  def show
    @sites = Site.all
    @site = @sites.find(params[:id])
  end
end
