class AntennasController < ApplicationController
  before_action :set_antenna, only: [:show, :edit, :update, :destroy]

  # GET /antennas
  # GET /antennas.json
  def index
    @antennas = Antenna.all
  end

  # GET /antennas/1
  # GET /antennas/1.json
  def show
  end

  # GET /antennas/new
  def new
    @antenna = Antenna.new
  end

  # GET /antennas/1/edit
  def edit
  end

  # POST /antennas
  # POST /antennas.json
  def create
    @antenna = Antenna.new(antenna_params)

    respond_to do |format|
      if @antenna.save
        format.html { redirect_to @antenna, notice: 'Antenna was successfully created.' }
        format.json { render :show, status: :created, location: @antenna }
      else
        format.html { render :new }
        format.json { render json: @antenna.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /antennas/1
  # PATCH/PUT /antennas/1.json
  def update
    respond_to do |format|
      if @antenna.update(antenna_params)
        format.html { redirect_to @antenna, notice: 'Antenna was successfully updated.' }
        format.json { render :show, status: :ok, location: @antenna }
      else
        format.html { render :edit }
        format.json { render json: @antenna.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /antennas/1
  # DELETE /antennas/1.json
  def destroy
    @antenna.destroy
    respond_to do |format|
      format.html { redirect_to antennas_url, notice: 'Antenna was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_antenna
      @antenna = Antenna.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def antenna_params
      params.require(:antenna).permit(:hardware_identifier, :location_id)
    end
end
