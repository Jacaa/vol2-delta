class CragsController < ApplicationController

  before_action :set_crag, only: [:show, :edit, :update, :destroy]

  # GET /crags
  # GET /crags.json
  def index
    @crags = Crag.all

    @crags_hash = Gmaps4rails.build_markers(@crags) do |crag, marker|
      marker.lat crag.latitude
      marker.lng crag.longitude
      marker.infowindow crag.name
    end

  end

  # GET /crags/1
  # GET /crags/1.json
  def show
    @crag = Crag.find(params[:id])
  end

  # GET /crags/new
  def new
    @crag = Crag.new
  end

  # GET /crags/1/edit
  def edit
    @crag = Crag.find(params[:id])
  end

  # POST /crags
  # POST /crags.json
  def create
    @crag = Crag.new(crag_params)

    respond_to do |format|
      if @crag.save
        format.html { redirect_to @crag, notice: 'Crag was successfully created.' }
        format.json { render :show, status: :created, location: @crag }
      else
        format.html { render :new }
        format.json { render json: @crag.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /crags/1
  # PATCH/PUT /crags/1.json
  def update
    respond_to do |format|
      if @crag.update(crag_params)
        format.html { redirect_to @crag, notice: 'Crag was successfully updated.' }
        format.json { render :show, status: :ok, location: @crag }
      else
        format.html { render :edit }
        format.json { render json: @crag.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /crags/1
  # DELETE /crags/1.json
  def destroy
    @crag.destroy
    respond_to do |format|
      format.html { redirect_to crags_url, notice: 'Crag was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_crag
      @crag = Crag.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def crag_params
      params.fetch(:crag, {})
    end
end
