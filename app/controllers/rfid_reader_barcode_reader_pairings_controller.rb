class RfidReaderBarcodeReaderPairingsController < ApplicationController
  before_action :set_rfid_reader_barcode_reader_pairing, only: [:show, :edit, :update, :destroy]

  # GET /rfid_reader_barcode_reader_pairings
  # GET /rfid_reader_barcode_reader_pairings.json
  def index
    @rfid_reader_barcode_reader_pairings = RfidReaderBarcodeReaderPairing.all
  end

  # GET /rfid_reader_barcode_reader_pairings/1
  # GET /rfid_reader_barcode_reader_pairings/1.json
  def show
  end

  # GET /rfid_reader_barcode_reader_pairings/new
  def new
    @rfid_reader_barcode_reader_pairing = RfidReaderBarcodeReaderPairing.new
  end

  # GET /rfid_reader_barcode_reader_pairings/1/edit
  def edit
  end

  # POST /rfid_reader_barcode_reader_pairings
  # POST /rfid_reader_barcode_reader_pairings.json
  def create
    @rfid_reader_barcode_reader_pairing = RfidReaderBarcodeReaderPairing.new(rfid_reader_barcode_reader_pairing_params)

    respond_to do |format|
      if @rfid_reader_barcode_reader_pairing.save
        format.html { redirect_to @rfid_reader_barcode_reader_pairing, notice: 'Rfid reader barcode reader pairing was successfully created.' }
        format.json { render :show, status: :created, location: @rfid_reader_barcode_reader_pairing }
      else
        format.html { render :new }
        format.json { render json: @rfid_reader_barcode_reader_pairing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rfid_reader_barcode_reader_pairings/1
  # PATCH/PUT /rfid_reader_barcode_reader_pairings/1.json
  def update
    respond_to do |format|
      if @rfid_reader_barcode_reader_pairing.update(rfid_reader_barcode_reader_pairing_params)
        format.html { redirect_to @rfid_reader_barcode_reader_pairing, notice: 'Rfid reader barcode reader pairing was successfully updated.' }
        format.json { render :show, status: :ok, location: @rfid_reader_barcode_reader_pairing }
      else
        format.html { render :edit }
        format.json { render json: @rfid_reader_barcode_reader_pairing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rfid_reader_barcode_reader_pairings/1
  # DELETE /rfid_reader_barcode_reader_pairings/1.json
  def destroy
    @rfid_reader_barcode_reader_pairing.destroy
    respond_to do |format|
      format.html { redirect_to rfid_reader_barcode_reader_pairings_url, notice: 'Rfid reader barcode reader pairing was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rfid_reader_barcode_reader_pairing
      @rfid_reader_barcode_reader_pairing = RfidReaderBarcodeReaderPairing.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rfid_reader_barcode_reader_pairing_params
      params.require(:rfid_reader_barcode_reader_pairing).permit(:barcode_reader_id, :rfid_reader_id)
    end
end
