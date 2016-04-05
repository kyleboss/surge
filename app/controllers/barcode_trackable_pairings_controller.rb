class BarcodeTrackablePairingsController < ApplicationController
  before_action :set_barcode_trackable_pairing, only: [:show, :edit, :update, :destroy]

  # GET /barcode_trackable_pairings
  # GET /barcode_trackable_pairings.json
  def index
    @barcode_trackable_pairings = BarcodeTrackablePairing.all
  end

  # GET /barcode_trackable_pairings/1
  # GET /barcode_trackable_pairings/1.json
  def show
  end

  # GET /barcode_trackable_pairings/new
  def new
    @barcode_trackable_pairing = BarcodeTrackablePairing.new
  end

  # GET /barcode_trackable_pairings/1/edit
  def edit
  end

  # POST /barcode_trackable_pairings
  # POST /barcode_trackable_pairings.json
  def create
    @barcode_trackable_pairing = BarcodeTrackablePairing.new(barcode_trackable_pairing_params)

    respond_to do |format|
      if @barcode_trackable_pairing.save
        format.html { redirect_to @barcode_trackable_pairing, notice: 'Barcode trackable pairing was successfully created.' }
        format.json { render :show, status: :created, location: @barcode_trackable_pairing }
      else
        format.html { render :new }
        format.json { render json: @barcode_trackable_pairing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /barcode_trackable_pairings/1
  # PATCH/PUT /barcode_trackable_pairings/1.json
  def update
    respond_to do |format|
      if @barcode_trackable_pairing.update(barcode_trackable_pairing_params)
        format.html { redirect_to @barcode_trackable_pairing, notice: 'Barcode trackable pairing was successfully updated.' }
        format.json { render :show, status: :ok, location: @barcode_trackable_pairing }
      else
        format.html { render :edit }
        format.json { render json: @barcode_trackable_pairing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /barcode_trackable_pairings/1
  # DELETE /barcode_trackable_pairings/1.json
  def destroy
    @barcode_trackable_pairing.destroy
    respond_to do |format|
      format.html { redirect_to barcode_trackable_pairings_url, notice: 'Barcode trackable pairing was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_barcode_trackable_pairing
      @barcode_trackable_pairing = BarcodeTrackablePairing.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def barcode_trackable_pairing_params
      params.require(:barcode_trackable_pairing).permit(:barcode_id, :trackable_id)
    end
end
