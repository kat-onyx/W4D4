class BandsController < ApplicationController

  def show
    @band = Band.find_by(id: params[:id])
    render :show
  end

  def index
    @bands = Band.all
    render :index
  end

  def create

  end

  def new

  end

  def edit

  end

  def band_params
    params.require(:bands).permit(:name)
  end
end
