class TypesController < ApplicationController
  def index
    @types = Hash.new {|h, k| h[k] = []}
    Type.all.each do |type|
      @types[type.meta] << type
    end
    puts @types
  end

  def show
    @type = Type.find(params[:id])
  end
end
