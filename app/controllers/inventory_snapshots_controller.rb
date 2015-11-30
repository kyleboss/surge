class InventorySnapshotsController < ApplicationController
  before_action :set_inventory_snapshot, only: [:show, :edit, :update, :destroy]
  protect_from_forgery :except => [:make_inventory_snapshot]

  # GET /inventory_snapshots
  # GET /inventory_snapshots.json
  def index
    @inventory_snapshots = InventorySnapshot.all
  end

  # GET /inventory_snapshots/1
  # GET /inventory_snapshots/1.json
  def show
  end

  # GET /inventory_snapshots/new
  def new
    @inventory_snapshot = InventorySnapshot.new
  end

  # GET /inventory_snapshots/1/edit
  def edit
  end

  # POST /inventory_snapshots
  # POST /inventory_snapshots.json
  def create
    @inventory_snapshot = InventorySnapshot.new(inventory_snapshot_params)

    respond_to do |format|
      if @inventory_snapshot.save
        format.html { redirect_to @inventory_snapshot, notice: 'Inventory snapshot was successfully created.' }
        format.json { render :show, status: :created, location: @inventory_snapshot }
      else
        format.html { render :new }
        format.json { render json: @inventory_snapshot.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /inventory_snapshots/1
  # PATCH/PUT /inventory_snapshots/1.json
  def update
    respond_to do |format|
      if @inventory_snapshot.update(inventory_snapshot_params)
        format.html { redirect_to @inventory_snapshot, notice: 'Inventory snapshot was successfully updated.' }
        format.json { render :show, status: :ok, location: @inventory_snapshot }
      else
        format.html { render :edit }
        format.json { render json: @inventory_snapshot.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /inventory_snapshots/1
  # DELETE /inventory_snapshots/1.json
  def destroy
    @inventory_snapshot.destroy
    respond_to do |format|
      format.html { redirect_to inventory_snapshots_url, notice: 'Inventory snapshot was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def make_inventory_snapshot
    print "MAKE INVENTORY SNAPSHOT"
    print params[:rfid_ids].values
    inventory_snapshot = InventorySnapshot.create_snapshot_with_contents(params[:antenna_id], params[:rfid_ids].values)
    InventorySnapshot.get_updates_from_previous_snapshot(inventory_snapshot)
    render plain: "Success"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_inventory_snapshot
      @inventory_snapshot = InventorySnapshot.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def inventory_snapshot_params
      params.require(:inventory_snapshot).permit(:location_id, :rfid_ids)
    end
end
