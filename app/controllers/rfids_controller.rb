class RfidsController < ApplicationController
  before_action :set_rfid, only: [:show, :edit, :update, :destroy]

  # GET /rfids
  # GET /rfids.json
  def index
    @rfids = Rfid.all
  end

  # GET /rfids/1
  # GET /rfids/1.json
  def show
  end

  # GET /rfids/new
  def new
    @rfid = Rfid.new
  end

  # GET /rfids/1/edit
  def edit
  end

  # POST /rfids
  # POST /rfids.json
  def create
    @rfid = Rfid.new(rfid_params)

    respond_to do |format|
      if @rfid.save
        format.html { redirect_to @rfid, notice: 'Rfid was successfully created.' }
        format.json { render :show, status: :created, location: @rfid }
      else
        format.html { render :new }
        format.json { render json: @rfid.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rfids/1
  # PATCH/PUT /rfids/1.json
  def update
    respond_to do |format|
      if @rfid.update(rfid_params)
        format.html { redirect_to @rfid, notice: 'Rfid was successfully updated.' }
        format.json { render :show, status: :ok, location: @rfid }
      else
        format.html { render :edit }
        format.json { render json: @rfid.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rfids/1
  # DELETE /rfids/1.json
  def destroy
    @rfid.destroy
    respond_to do |format|
      format.html { redirect_to rfids_url, notice: 'Rfid was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rfid
      @rfid = Rfid.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rfid_params
      params.require(:rfid).permit(:hardware_identifier)
    end
end
