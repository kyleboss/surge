class BarcodeReadersController < ApplicationController
  before_action :set_barcode_reader, only: [:show, :edit, :update, :destroy]

  # GET /barcode_readers
  # GET /barcode_readers.json
  def index
    @barcode_readers = BarcodeReader.all
  end

  # GET /barcode_readers/1
  # GET /barcode_readers/1.json
  def show
  end

  # GET /barcode_readers/new
  def new
    @barcode_reader = BarcodeReader.new
  end

  # GET /barcode_readers/1/edit
  def edit
  end

  # POST /barcode_readers
  # POST /barcode_readers.json
  def create
    @barcode_reader = BarcodeReader.new(barcode_reader_params)

    respond_to do |format|
      if @barcode_reader.save
        format.html { redirect_to @barcode_reader, notice: 'Barcode reader was successfully created.' }
        format.json { render :show, status: :created, location: @barcode_reader }
      else
        format.html { render :new }
        format.json { render json: @barcode_reader.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /barcode_readers/1
  # PATCH/PUT /barcode_readers/1.json
  def update
    respond_to do |format|
      if @barcode_reader.update(barcode_reader_params)
        format.html { redirect_to @barcode_reader, notice: 'Barcode reader was successfully updated.' }
        format.json { render :show, status: :ok, location: @barcode_reader }
      else
        format.html { render :edit }
        format.json { render json: @barcode_reader.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /barcode_readers/1
  # DELETE /barcode_readers/1.json
  def destroy
    @barcode_reader.destroy
    respond_to do |format|
      format.html { redirect_to barcode_readers_url, notice: 'Barcode reader was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_barcode_reader
      @barcode_reader = BarcodeReader.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def barcode_reader_params
      params.require(:barcode_reader).permit(:reader_id)
    end
end
