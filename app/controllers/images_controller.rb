class ImagesController < ApplicationController
  def show
    url = 'app/assets/images/' + params[:path] + '.' + params[:format]
    send_file url
  end
end
