class InventorySnapshotContentsController < ApplicationController
  before_action :set_inventory_snapshot_content, only: [:show, :edit, :update, :destroy]

  # GET /inventory_snapshot_contents
  # GET /inventory_snapshot_contents.json
  def index
    @inventory_snapshot_contents = InventorySnapshotContent.all
  end

  # GET /inventory_snapshot_contents/1
  # GET /inventory_snapshot_contents/1.json
  def show
  end

  # GET /inventory_snapshot_contents/new
  def new
    @inventory_snapshot_content = InventorySnapshotContent.new
  end

  # GET /inventory_snapshot_contents/1/edit
  def edit
  end

  # POST /inventory_snapshot_contents
  # POST /inventory_snapshot_contents.json
  def create

    @inventory_snapshot_content = InventorySnapshotContent.new(inventory_snapshot_content_params)

    respond_to do |format|
      if @inventory_snapshot_content.save
        format.html { redirect_to @inventory_snapshot_content, notice: 'Inventory snapshot content was successfully created.' }
        format.json { render :show, status: :created, location: @inventory_snapshot_content }
      else
        format.html { render :new }
        format.json { render json: @inventory_snapshot_content.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /inventory_snapshot_contents/1
  # PATCH/PUT /inventory_snapshot_contents/1.json
  def update
    respond_to do |format|
      if @inventory_snapshot_content.update(inventory_snapshot_content_params)
        format.html { redirect_to @inventory_snapshot_content, notice: 'Inventory snapshot content was successfully updated.' }
        format.json { render :show, status: :ok, location: @inventory_snapshot_content }
      else
        format.html { render :edit }
        format.json { render json: @inventory_snapshot_content.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /inventory_snapshot_contents/1
  # DELETE /inventory_snapshot_contents/1.json
  def destroy
    @inventory_snapshot_content.destroy
    respond_to do |format|
      format.html { redirect_to inventory_snapshot_contents_url, notice: 'Inventory snapshot content was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_inventory_snapshot_content
      @inventory_snapshot_content = InventorySnapshotContent.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def inventory_snapshot_content_params
      params.require(:inventory_snapshot_content).permit(:inventory_snapshot_id, :rfid_hardware_id, :trackable_id)
    end
end
