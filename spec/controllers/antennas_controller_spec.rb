require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

RSpec.describe AntennasController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # Antenna. As you add validations to Antenna, be sure to
  # adjust the attributes here as well.
  before(:each) do
    address = FactoryGirl.create(:address)
    hospital = FactoryGirl.create(:hospital, address_id: address.id)
    @location = FactoryGirl.create(:location, hospital_id: hospital.id)
  end

  let(:valid_attributes) { FactoryGirl.attributes_for(:antenna, location_id: @location.id) }
  let(:new_attributes) { FactoryGirl.attributes_for(:updated_valid_antenna) }
  let(:invalid_attributes) { FactoryGirl.attributes_for(:invalid_antenna) }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # AntennasController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all antennas as @antennas" do
      antenna = Antenna.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:antennas)).to eq([antenna])
    end
  end

  describe "GET #show" do
    it "assigns the requested antenna as @antenna" do
      antenna = Antenna.create! valid_attributes
      get :show, {:id => antenna.to_param}, valid_session
      expect(assigns(:antenna)).to eq(antenna)
    end
  end

  describe "GET #new" do
    it "assigns a new antenna as @antenna" do
      get :new, {}, valid_session
      expect(assigns(:antenna)).to be_a_new(Antenna)
    end
  end

  describe "GET #edit" do
    it "assigns the requested antenna as @antenna" do
      antenna = Antenna.create! valid_attributes
      get :edit, {:id => antenna.to_param}, valid_session
      expect(assigns(:antenna)).to eq(antenna)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Antenna" do
        expect {
          post :create, {:antenna => valid_attributes}, valid_session
        }.to change(Antenna, :count).by(1)
      end

      it "assigns a newly created antenna as @antenna" do
        post :create, {:antenna => valid_attributes}, valid_session
        expect(assigns(:antenna)).to be_a(Antenna)
        expect(assigns(:antenna)).to be_persisted
      end

      it "redirects to the created antenna" do
        post :create, {:antenna => valid_attributes}, valid_session
        expect(response).to redirect_to(Antenna.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved antenna as @antenna" do
        post :create, {:antenna => invalid_attributes}, valid_session
        expect(assigns(:antenna)).to be_a_new(Antenna)
      end

      it "re-renders the 'new' template" do
        post :create, {:antenna => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do

      it "updates the requested antenna" do
        antenna = Antenna.create! valid_attributes
        put :update, {:id => antenna.to_param, :antenna => new_attributes}, valid_session
        antenna.reload
        expect(antenna.attributes).to include( { "hardware_identifier" => new_attributes[:hardware_identifier] } )
      end

      it "assigns the requested antenna as @antenna" do
        antenna = Antenna.create! valid_attributes
        put :update, {:id => antenna.to_param, :antenna => valid_attributes}, valid_session
        expect(assigns(:antenna)).to eq(antenna)
      end

      it "redirects to the antenna" do
        antenna = Antenna.create! valid_attributes
        put :update, {:id => antenna.to_param, :antenna => valid_attributes}, valid_session
        expect(response).to redirect_to(antenna)
      end
    end

    context "with invalid params" do
      it "assigns the antenna as @antenna" do
        antenna = Antenna.create! valid_attributes
        put :update, {:id => antenna.to_param, :antenna => invalid_attributes}, valid_session
        expect(assigns(:antenna)).to eq(antenna)
      end

      it "re-renders the 'edit' template" do
        antenna = Antenna.create! valid_attributes
        put :update, {:id => antenna.to_param, :antenna => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested antenna" do
      antenna = Antenna.create! valid_attributes
      expect {
        delete :destroy, {:id => antenna.to_param}, valid_session
      }.to change(Antenna, :count).by(-1)
    end

    it "redirects to the antennas list" do
      antenna = Antenna.create! valid_attributes
      delete :destroy, {:id => antenna.to_param}, valid_session
      expect(response).to redirect_to(antennas_url)
    end
  end

end
