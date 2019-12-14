class StartupsPicturesController < ApplicationController
  def create
  	@startup = Startup.find(params[:startup_id])
  	@startup.startup_picture.attach(params[:startup_picture])
  	redirect_to(startup_path(@startup))
  end
end
