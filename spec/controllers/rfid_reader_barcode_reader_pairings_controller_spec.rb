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

RSpec.describe RfidReaderBarcodeReaderPairingsController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # RfidReaderBarcodeReaderPairing. As you add validations to RfidReaderBarcodeReaderPairing, be sure to
  # adjust the attributes here as well.
  before(:each) do
    address = FactoryGirl.create(:address)
    @hospital = FactoryGirl.create(:hospital, address_id: address.id)
    @rfid_reader = FactoryGirl.create(:rfid_reader, hospital_id: @hospital.id)
    @barcode_reader = FactoryGirl.create(:barcode_reader, hospital_id: @hospital.id)
    @updated_barcode_reader = FactoryGirl.create(:updated_valid_barcode_reader, hospital_id: @hospital.id)
  end

  let(:valid_attributes) {
    FactoryGirl.attributes_for(:rfid_reader_barcode_reader_pairing,
                               rfid_reader_id:    @rfid_reader.id,
                               barcode_reader_id: @barcode_reader.id)
  }
  let(:invalid_attributes) { FactoryGirl.attributes_for(:invalid_rfid_reader,
                                                        barcode_reader_id:  nil,
                                                        rfid_reader_id:     @rfid_reader.id) }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # RfidReaderBarcodeReaderPairingsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all rfid_reader_barcode_reader_pairings as @rfid_reader_barcode_reader_pairings" do
      rfid_reader_barcode_reader_pairing = RfidReaderBarcodeReaderPairing.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:rfid_reader_barcode_reader_pairings)).to eq([rfid_reader_barcode_reader_pairing])
    end
  end

  describe "GET #show" do
    it "assigns the requested rfid_reader_barcode_reader_pairing as @rfid_reader_barcode_reader_pairing" do
      rfid_reader_barcode_reader_pairing = RfidReaderBarcodeReaderPairing.create! valid_attributes
      get :show, {:id => rfid_reader_barcode_reader_pairing.to_param}, valid_session
      expect(assigns(:rfid_reader_barcode_reader_pairing)).to eq(rfid_reader_barcode_reader_pairing)
    end
  end

  describe "GET #new" do
    it "assigns a new rfid_reader_barcode_reader_pairing as @rfid_reader_barcode_reader_pairing" do
      get :new, {}, valid_session
      expect(assigns(:rfid_reader_barcode_reader_pairing)).to be_a_new(RfidReaderBarcodeReaderPairing)
    end
  end

  describe "GET #edit" do
    it "assigns the requested rfid_reader_barcode_reader_pairing as @rfid_reader_barcode_reader_pairing" do
      rfid_reader_barcode_reader_pairing = RfidReaderBarcodeReaderPairing.create! valid_attributes
      get :edit, {:id => rfid_reader_barcode_reader_pairing.to_param}, valid_session
      expect(assigns(:rfid_reader_barcode_reader_pairing)).to eq(rfid_reader_barcode_reader_pairing)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new RfidReaderBarcodeReaderPairing" do
        expect {
          post :create, {:rfid_reader_barcode_reader_pairing => valid_attributes}, valid_session
        }.to change(RfidReaderBarcodeReaderPairing, :count).by(1)
      end

      it "assigns a newly created rfid_reader_barcode_reader_pairing as @rfid_reader_barcode_reader_pairing" do
        post :create, {:rfid_reader_barcode_reader_pairing => valid_attributes}, valid_session
        expect(assigns(:rfid_reader_barcode_reader_pairing)).to be_a(RfidReaderBarcodeReaderPairing)
        expect(assigns(:rfid_reader_barcode_reader_pairing)).to be_persisted
      end

      it "redirects to the created rfid_reader_barcode_reader_pairing" do
        post :create, {:rfid_reader_barcode_reader_pairing => valid_attributes}, valid_session
        expect(response).to redirect_to(RfidReaderBarcodeReaderPairing.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved rfid_reader_barcode_reader_pairing as @rfid_reader_barcode_reader_pairing" do
        post :create, {:rfid_reader_barcode_reader_pairing => invalid_attributes}, valid_session
        expect(assigns(:rfid_reader_barcode_reader_pairing)).to be_a_new(RfidReaderBarcodeReaderPairing)
      end

      it "re-renders the 'new' template" do
        post :create, {:rfid_reader_barcode_reader_pairing => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        FactoryGirl.attributes_for(:updated_valid_rfid_reader_barcode_reader_pairing,
                                   rfid_reader_id:    @rfid_reader.id,
                                   barcode_reader_id: @barcode_reader.id)
      }


      it "updates the requested rfid_reader_barcode_reader_pairing" do
        rfid_reader_barcode_reader_pairing = RfidReaderBarcodeReaderPairing.create! valid_attributes
        put :update, {:id => rfid_reader_barcode_reader_pairing.to_param, :rfid_reader_barcode_reader_pairing => new_attributes}, valid_session
        rfid_reader_barcode_reader_pairing.reload
      end

      it "assigns the requested rfid_reader_barcode_reader_pairing as @rfid_reader_barcode_reader_pairing" do
        rfid_reader_barcode_reader_pairing = RfidReaderBarcodeReaderPairing.create! valid_attributes
        put :update, {:id => rfid_reader_barcode_reader_pairing.to_param, :rfid_reader_barcode_reader_pairing => valid_attributes}, valid_session
        expect(assigns(:rfid_reader_barcode_reader_pairing)).to eq(rfid_reader_barcode_reader_pairing)
      end

      it "redirects to the rfid_reader_barcode_reader_pairing" do
        rfid_reader_barcode_reader_pairing = RfidReaderBarcodeReaderPairing.create! valid_attributes
        put :update, {:id => rfid_reader_barcode_reader_pairing.to_param, :rfid_reader_barcode_reader_pairing => valid_attributes}, valid_session
        expect(response).to redirect_to(rfid_reader_barcode_reader_pairing)
      end
    end

    context "with invalid params" do
      it "assigns the rfid_reader_barcode_reader_pairing as @rfid_reader_barcode_reader_pairing" do
        rfid_reader_barcode_reader_pairing = RfidReaderBarcodeReaderPairing.create! valid_attributes
        put :update, {:id => rfid_reader_barcode_reader_pairing.to_param, :rfid_reader_barcode_reader_pairing => invalid_attributes}, valid_session
        expect(assigns(:rfid_reader_barcode_reader_pairing)).to eq(rfid_reader_barcode_reader_pairing)
      end

      it "re-renders the 'edit' template" do
        rfid_reader_barcode_reader_pairing = RfidReaderBarcodeReaderPairing.create! valid_attributes
        put :update, {:id => rfid_reader_barcode_reader_pairing.to_param, :rfid_reader_barcode_reader_pairing => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested rfid_reader_barcode_reader_pairing" do
      rfid_reader_barcode_reader_pairing = RfidReaderBarcodeReaderPairing.create! valid_attributes
      expect {
        delete :destroy, {:id => rfid_reader_barcode_reader_pairing.to_param}, valid_session
      }.to change(RfidReaderBarcodeReaderPairing, :count).by(-1)
    end

    it "redirects to the rfid_reader_barcode_reader_pairings list" do
      rfid_reader_barcode_reader_pairing = RfidReaderBarcodeReaderPairing.create! valid_attributes
      delete :destroy, {:id => rfid_reader_barcode_reader_pairing.to_param}, valid_session
      expect(response).to redirect_to(rfid_reader_barcode_reader_pairings_url)
    end
  end

end
