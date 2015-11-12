class DrugsController < ApplicationController
  before_action :set_drug, only: [:show, :edit, :update, :destroy]

  # GET /drugs
  # GET /drugs.json
  def index
    @drugs = Drug.all
  end

  # GET /drugs/1
  # GET /drugs/1.json
  def show
    brand_drug_qry    = "pills.drug_id=#{@drug.id} AND pills.brand_id=brands.id"
    loc_drug_qry      = "pills.drug_id=#{@drug.id} AND pills.location_id=locations.id"
    brand_select_qry  = "brands.id AS brand_id, brands.name AS brand_name, SUM(qty) AS brand_qty"
    loc_select_qry    = "locations.id AS location_id, locations.name AS location_name, SUM(qty) AS location_qty"
    @brands           = Pill.joins(:brand).select(brand_select_qry).where(brand_drug_qry).group("brands.id")
    @locations        = Pill.joins(:location).select(loc_select_qry).where(loc_drug_qry).group("locations.id")
  end

  # GET /drugs/new
  def new
    @drug = Drug.new
  end

  # GET /drugs/1/edit
  def edit
  end

  # POST /drugs
  # POST /drugs.json
  def create
    @drug = Drug.new(drug_params)

    respond_to do |format|
      if @drug.save
        format.html { redirect_to @drug, notice: 'Drug was successfully created.' }
        format.json { render :show, status: :created, location: @drug }
      else
        format.html { render :new }
        format.json { render json: @drug.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /drugs/1
  # PATCH/PUT /drugs/1.json
  def update
    respond_to do |format|
      if @drug.update(drug_params)
        format.html { redirect_to @drug, notice: 'Drug was successfully updated.' }
        format.json { render :show, status: :ok, location: @drug }
      else
        format.html { render :edit }
        format.json { render json: @drug.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /drugs/1
  # DELETE /drugs/1.json
  def destroy
    @drug.destroy
    respond_to do |format|
      format.html { redirect_to drugs_url, notice: 'Drug was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_drug
      @drug = Drug.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def drug_params
      params.require(:drug).permit(:name)
    end
end
