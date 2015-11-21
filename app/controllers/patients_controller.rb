class PatientsController < ApplicationController
  before_action :set_patient, only: [:show, :edit, :update, :destroy]


  # GET /patients
  # GET /patients.json
  def index
    @patients = Patient.all
  end

  # GET /patients/1
  # GET /patients/1.json
  def show
    get_all_trackables_of_patient()
  end

  # GET /patients/new
  def new
    @patient = Patient.new
  end

  # GET /patients/1/edit
  def edit
  end

  # POST /patients
  # POST /patients.json
  def create
    @patient = Patient.new(patient_params)

    respond_to do |format|
      if @patient.save
        format.html { redirect_to @patient, notice: 'Patient was successfully created.' }
        format.json { render :show, status: :created, location: @patient }
      else
        format.html { render :new }
        format.json { render json: @patient.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /patients/1
  # PATCH/PUT /patients/1.json
  def update
    respond_to do |format|
      if @patient.update(patient_params)
        format.html { redirect_to @patient, notice: 'Patient was successfully updated.' }
        format.json { render :show, status: :ok, location: @patient }
      else
        format.html { render :edit }
        format.json { render json: @patient.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /patients/1
  # DELETE /patients/1.json
  def destroy
    @patient.destroy
    respond_to do |format|
      format.html { redirect_to patients_url, notice: 'Patient was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def make_spotlight_search()
    query             = params["query"]
    current_hospital  = session[:hospital_id].to_s
    render json: Search.new(query, current_hospital)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_patient
      if (session[:user_id])
        @user         = User.find(session[:user_id])
        hospital_id   = @user.hospital_id
        @hospital     = Hospital.find(hospital_id)
        @patient      = Patient.find(params[:id])
        set_header()
      else
        redirect_to root_url
      end
    end

  def get_all_trackables_of_patient()
    @trackables_of_patient = Trackable.find_by_sql("SELECT t.*, t.id AS trackable_id, a1.*, l.name AS location_name,
a1.updated_at AS last_arrival_time
FROM trackables t
INNER JOIN arrivals a1 ON (t.id = a1.trackable_id)
LEFT OUTER JOIN arrivals a2 ON (t.id = a2.trackable_id AND
    (a1.updated_at < a2.updated_at OR a1.updated_at = a2.updated_at AND a1.id < a2.id))
INNER JOIN locations as l ON (l.id = a1.location_id)
WHERE a2.id IS NULL;")
  end

  def set_header
    @show_header  = true
    @header_title = @patient.name
  end

    # Never trust parameters from the scary internet, only allow the white list through.
    def patient_params
      params.require(:patient).permit(:mrn, :name, :hospital_id)
    end
end
