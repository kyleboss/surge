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

RSpec.describe BarcodeTrackablePairingsController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # BarcodeTrackablePairing. As you add validations to BarcodeTrackablePairing, be sure to
  # adjust the attributes here as well.
  before(:each) do
    address = FactoryGirl.create(:address)
    hospital = FactoryGirl.create(:hospital, address_id: address.id)
    patient = FactoryGirl.create(:patient, hospital_id: hospital.id)
    @trackable = FactoryGirl.create(:trackable, patient_id: patient.id)
    @barcode = FactoryGirl.create(:barcode)
  end

  let(:valid_attributes) {
    FactoryGirl.attributes_for(:barcode_trackable_pairing, barcode_id: @barcode.id, trackable_id: @trackable.id)
  }

  let(:invalid_attributes) {
    FactoryGirl.attributes_for(:invalid_barcode_trackable_pairing, barcode_reader: nil, trackable: @trackable.id)
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # BarcodeTrackablePairingsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all barcode_trackable_pairings as @barcode_trackable_pairings" do
      barcode_trackable_pairing = BarcodeTrackablePairing.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:barcode_trackable_pairings)).to eq([barcode_trackable_pairing])
    end
  end

  describe "GET #show" do
    it "assigns the requested barcode_trackable_pairing as @barcode_trackable_pairing" do
      barcode_trackable_pairing = BarcodeTrackablePairing.create! valid_attributes
      get :show, {:id => barcode_trackable_pairing.to_param}, valid_session
      expect(assigns(:barcode_trackable_pairing)).to eq(barcode_trackable_pairing)
    end
  end

  describe "GET #new" do
    it "assigns a new barcode_trackable_pairing as @barcode_trackable_pairing" do
      get :new, {}, valid_session
      expect(assigns(:barcode_trackable_pairing)).to be_a_new(BarcodeTrackablePairing)
    end
  end

  describe "GET #edit" do
    it "assigns the requested barcode_trackable_pairing as @barcode_trackable_pairing" do
      barcode_trackable_pairing = BarcodeTrackablePairing.create! valid_attributes
      get :edit, {:id => barcode_trackable_pairing.to_param}, valid_session
      expect(assigns(:barcode_trackable_pairing)).to eq(barcode_trackable_pairing)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new BarcodeTrackablePairing" do
        expect {
          post :create, {:barcode_trackable_pairing => valid_attributes}, valid_session
        }.to change(BarcodeTrackablePairing, :count).by(1)
      end

      it "assigns a newly created barcode_trackable_pairing as @barcode_trackable_pairing" do
        post :create, {:barcode_trackable_pairing => valid_attributes}, valid_session
        expect(assigns(:barcode_trackable_pairing)).to be_a(BarcodeTrackablePairing)
        expect(assigns(:barcode_trackable_pairing)).to be_persisted
      end

      it "redirects to the created barcode_trackable_pairing" do
        post :create, {:barcode_trackable_pairing => valid_attributes}, valid_session
        expect(response).to redirect_to(BarcodeTrackablePairing.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved barcode_trackable_pairing as @barcode_trackable_pairing" do
        post :create, {:barcode_trackable_pairing => invalid_attributes}, valid_session
        expect(assigns(:barcode_trackable_pairing)).to be_a_new(BarcodeTrackablePairing)
      end

      it "re-renders the 'new' template" do
        post :create, {:barcode_trackable_pairing => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        updated_trackable = FactoryGirl.create(:updated_valid_trackable)
        FactoryGirl.attributes_for(:updated_valid_barcode_trackable_pairing,
                                   barcode_id:    @barcode.id,
                                   trackable_id:  updated_trackable.id)
      }

      it "updates the requested barcode_trackable_pairing" do
        barcode_trackable_pairing = BarcodeTrackablePairing.create! valid_attributes
        put :update, {:id => barcode_trackable_pairing.to_param, :barcode_trackable_pairing => new_attributes}, valid_session
        barcode_trackable_pairing.reload
      end

      it "assigns the requested barcode_trackable_pairing as @barcode_trackable_pairing" do
        barcode_trackable_pairing = BarcodeTrackablePairing.create! valid_attributes
        put :update, {:id => barcode_trackable_pairing.to_param, :barcode_trackable_pairing => valid_attributes}, valid_session
        expect(assigns(:barcode_trackable_pairing)).to eq(barcode_trackable_pairing)
      end

      it "redirects to the barcode_trackable_pairing" do
        barcode_trackable_pairing = BarcodeTrackablePairing.create! valid_attributes
        put :update, {:id => barcode_trackable_pairing.to_param, :barcode_trackable_pairing => valid_attributes}, valid_session
        expect(response).to redirect_to(barcode_trackable_pairing)
      end
    end

    context "with invalid params" do
      it "assigns the barcode_trackable_pairing as @barcode_trackable_pairing" do
        barcode_trackable_pairing = BarcodeTrackablePairing.create! valid_attributes
        put :update, {:id => barcode_trackable_pairing.to_param, :barcode_trackable_pairing => invalid_attributes}, valid_session
        expect(assigns(:barcode_trackable_pairing)).to eq(barcode_trackable_pairing)
      end

      it "re-renders the 'edit' template" do
        barcode_trackable_pairing = BarcodeTrackablePairing.create! valid_attributes
        put :update, {:id => barcode_trackable_pairing.to_param, :barcode_trackable_pairing => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested barcode_trackable_pairing" do
      barcode_trackable_pairing = BarcodeTrackablePairing.create! valid_attributes
      expect {
        delete :destroy, {:id => barcode_trackable_pairing.to_param}, valid_session
      }.to change(BarcodeTrackablePairing, :count).by(-1)
    end

    it "redirects to the barcode_trackable_pairings list" do
      barcode_trackable_pairing = BarcodeTrackablePairing.create! valid_attributes
      delete :destroy, {:id => barcode_trackable_pairing.to_param}, valid_session
      expect(response).to redirect_to(barcode_trackable_pairings_url)
    end
  end

end
