class SvgsController < ApplicationController
  def show
    puts params[:id]
    respond_to do |format|
      format.xml {render xml: Svg.find(params[:id]).content}
    end
  end
end
