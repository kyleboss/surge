class TrackablesController < ApplicationController
  before_action :set_trackable, only: [:show, :edit, :update, :destroy]

  # GET /trackables
  # GET /trackables.json
  def index
    @trackables = Trackable.all
  end

  # GET /trackables/1
  # GET /trackables/1.json
  def show
    get_all_arrivals_of_trackable()
  end

  # GET /trackables/new
  def new
    @trackable = Trackable.new
  end

  # GET /trackables/1/edit
  def edit
  end

  # POST /trackables
  # POST /trackables.json
  def create
    @trackable = Trackable.new(trackable_params)

    respond_to do |format|
      if @trackable.save
        format.html { redirect_to @trackable, notice: 'Trackable was successfully created.' }
        format.json { render :show, status: :created, location: @trackable }
      else
        format.html { render :new }
        format.json { render json: @trackable.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /trackables/1
  # PATCH/PUT /trackables/1.json
  def update
    respond_to do |format|
      if @trackable.update(trackable_params)
        format.html { redirect_to @trackable, notice: 'Trackable was successfully updated.' }
        format.json { render :show, status: :ok, location: @trackable }
      else
        format.html { render :edit }
        format.json { render json: @trackable.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trackables/1
  # DELETE /trackables/1.json
  def destroy
    @trackable.destroy
    respond_to do |format|
      format.html { redirect_to trackables_url, notice: 'Trackable was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trackable
      if (session[:user_id])
        @user         = User.find(session[:user_id])
        hospital_id   = @user.hospital_id
        @hospital     = Hospital.find(hospital_id)
        @trackable    = Trackable.find(params[:id])
        set_header()
      else
        redirect_to root_url
      end
    end

  def get_all_arrivals_of_trackable()
    arrivals_selections     = "locations.name AS location_name, arrivals.updated_at AS arrival_time"
    @arrivals_of_trackable  = Arrival.select(arrivals_selections).where(:trackable_id => @trackable.id).joins(:location)
                                  .order("arrivals.updated_at DESC")
  end

  def set_header
    @show_header  = true
    @header_title = @trackable.drug_name
  end

    # Never trust parameters from the scary internet, only allow the white list through.
    def trackable_params
      params.require(:trackable).permit(:patient_id, :admin_dose, :drug_name, :brand_name, :order_id, :med_id, :sig, :admin)
    end
end
