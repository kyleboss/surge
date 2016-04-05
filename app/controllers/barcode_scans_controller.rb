class BarcodeScansController < ApplicationController
  before_action :set_barcode_scan, only: [:show, :edit, :update, :destroy]
  protect_from_forgery :except => [:scan_barcode]

  # GET /barcode_scans
  # GET /barcode_scans.json
  def index
    @barcode_scans = BarcodeScan.all
  end

  # GET /barcode_scans/1
  # GET /barcode_scans/1.json
  def show
  end

  # GET /barcode_scans/new
  def new
    @barcode_scan = BarcodeScan.new
  end

  # GET /barcode_scans/1/edit
  def edit
  end

  # POST /barcode_scans
  # POST /barcode_scans.json
  def create
    BarcodeScan.scan(barcode_scan_params[:barcode_reader_hardware_identifier], barcode_scan_params[:barcode_code])
    respond_to do |format|
      format.html { redirect_to "/barcode_scans", notice: 'Barcode scan was successfully created.' }
      format.json { render :index }
    end
  end

  # PATCH/PUT /barcode_scans/1
  # PATCH/PUT /barcode_scans/1.json
  def update
    respond_to do |format|
      if @barcode_scan.update(barcode_scan_params)
        format.html { redirect_to @barcode_scan, notice: 'Barcode scan was successfully updated.' }
        format.json { render :show, status: :ok, location: @barcode_scan }
      else
        format.html { render :edit }
        format.json { render json: @barcode_scan.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /barcode_scans/1
  # DELETE /barcode_scans/1.json
  def destroy
    @barcode_scan.destroy
    respond_to do |format|
      format.html { redirect_to barcode_scans_url, notice: 'Barcode scan was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def scan_barcode
    BarcodeScan.scan(params[:barcode_reader_hardware_identifier], params[:barcode_code])
    render plain: "Success"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_barcode_scan
      @barcode_scan = BarcodeScan.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def barcode_scan_params
      params.require(:barcode_scan).permit(:barcode_reader_hardware_identifier, :barcode_code)
    end
end
