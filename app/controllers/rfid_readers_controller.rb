class RfidReadersController < ApplicationController
  before_action :set_rfid_reader, only: [:show, :edit, :update, :destroy]

  # GET /rfid_readers
  # GET /rfid_readers.json
  def index
    @rfid_readers = RfidReader.all
  end

  # GET /rfid_readers/1
  # GET /rfid_readers/1.json
  def show
  end

  # GET /rfid_readers/new
  def new
    @rfid_reader = RfidReader.new
  end

  # GET /rfid_readers/1/edit
  def edit
  end

  # POST /rfid_readers
  # POST /rfid_readers.json
  def create
    @rfid_reader = RfidReader.new(rfid_reader_params)

    respond_to do |format|
      if @rfid_reader.save
        format.html { redirect_to @rfid_reader, notice: 'Rfid reader was successfully created.' }
        format.json { render :show, status: :created, location: @rfid_reader }
      else
        format.html { render :new }
        format.json { render json: @rfid_reader.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rfid_readers/1
  # PATCH/PUT /rfid_readers/1.json
  def update
    respond_to do |format|
      if @rfid_reader.update(rfid_reader_params)
        format.html { redirect_to @rfid_reader, notice: 'Rfid reader was successfully updated.' }
        format.json { render :show, status: :ok, location: @rfid_reader }
      else
        format.html { render :edit }
        format.json { render json: @rfid_reader.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rfid_readers/1
  # DELETE /rfid_readers/1.json
  def destroy
    @rfid_reader.destroy
    respond_to do |format|
      format.html { redirect_to rfid_readers_url, notice: 'Rfid reader was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rfid_reader
      @rfid_reader = RfidReader.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rfid_reader_params
      params.require(:rfid_reader).permit(:hardware_identifier, :hospital_id)
    end
end
