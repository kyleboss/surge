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
    @trackable_updates = Arrival.find_by_sql("SELECT * FROM
      (
          SELECT 'is_arrival' AS update_type, arrivals.*, locations.name AS location_name,
          arrivals.updated_at AS update_time
          FROM arrivals
          INNER JOIN locations ON arrivals.location_id = locations.id
          WHERE arrivals.trackable_id = #{@trackable.id}
          UNION ALL
          SELECT 'is_departure' AS update_type, departures.*, locations.name AS location_name,
          departures.updated_at AS update_time
          FROM departures
          INNER JOIN locations ON departures.location_id = locations.id
          WHERE departures.trackable_id = #{@trackable.id}
      ) T1
      ORDER BY update_time DESC")
  end

  def set_header
    @show_header  = true
    @header_title = @trackable.drug_name
  end

  def trackable_params
    patient_info = permit_patient_params
    patient_id = Patient.find_or_create_by(mrn: patient_info[:mrn]).id
    patient = Patient.find(patient_id)
    patient.name = patient_info[:name]
    patient.hospital_id = @user.hospital_id
    patient.save

    trackable_info = permit_trackable_params

    new_trackable_info = {patient_id: patient_id, admin_dose: trackable_info[:admin_dose],
                          drug_name: trackable_info[:drug_name], brand_name: trackable_info[:brand_name],
                          order_id: trackable_info[:order_id], med_id: trackable_info[:med_id],
                          sig: trackable_info[:sig], admin: trackable_info[:admin]}

    return new_trackable_info
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def permit_trackable_params
    params.require(:trackable).permit(:patient_id, :admin_dose, :drug_name, :brand_name, :order_id, :med_id, :sig, :admin)
    return params[:trackable]
  end

  def permit_patient_params
    params.require(:patient).permit(:name, :mrn)
    return params[:patient]
  end

end
