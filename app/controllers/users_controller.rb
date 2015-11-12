class UsersController < ApplicationController
  include PasswordDigester
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    def find_or_create_by_address_id(address_info)
      street_address  = address_info[:street_address]
      city            = address_info[:city]
      state           = address_info[:state]
      zip_code        = address_info[:zip_code]
      country         = address_info[:country]

      return Address.find_or_create_by(:street_address => street_address,
                                       :city => city,
                                       :state => state,
                                       :zip_code => zip_code,
                                       :country => country).id
    end

    def permit_user_params
      params.require(:user).permit(:first_name, :middle_initial, :last_name, :phone, :address_id, :street_address,
                                   :city, :state, :zip_code, :country, :email, :password, :hospital_id)
      return params[:user]
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      user_info               = permit_user_params()
      encryptedPassword       = PasswordDigester.encrypt(user_info[:password])
      user_info[:address_id]  = find_or_create_by_address_id(user_info)
      user_info[:hospital_id] = Hospital.first.id
      new_user_info           = {first_name: user_info[:first_name],
                                 middle_initial: user_info[:middle_initial],
                                 last_name: user_info[:last_name],
                                 phone: user_info[:phone],
                                 address_id: user_info[:address_id],
                                 hospital_id: user_info[:hospital_id],
                                 email: user_info[:email],
                                 password: encryptedPassword}
      return new_user_info
    end
end
