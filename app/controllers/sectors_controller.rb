class SectorsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_sector, only: [:show, :edit, :update, :destroy]

  def index
    @sectors = Sector.all
  end

  def show; end

  def new
    @sector = Sector.new
  end

  def create
    @sector = Sector.new(sector_params)
    if @sector.save
      redirect_to crag_sectors_path @sector.crag
    else
      render 'new'
    end
  end

  def edit
    @crags = Crag.all
  end

  def update
    if @sector.update(sector_params)
      redirect_to sectors_url
    else
      render 'edit'
    end
  end

  def destroy
    @sector.destroy
    redirect_to sectors_url
  end

  private

  def set_sector
    @sector = Sector.find(params[:id])
  end

  def sector_params
    params.require(:sector).permit(:name, :aspect, :latitude, :longitude, :crag_id)
  end
end
