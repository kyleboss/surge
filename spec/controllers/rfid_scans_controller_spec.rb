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

RSpec.describe RfidScansController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # RfidScan. As you add validations to RfidScan, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # RfidScansController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all rfid_scans as @rfid_scans" do
      rfid_scan = RfidScan.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:rfid_scans)).to eq([rfid_scan])
    end
  end

  describe "GET #show" do
    it "assigns the requested rfid_scan as @rfid_scan" do
      rfid_scan = RfidScan.create! valid_attributes
      get :show, {:id => rfid_scan.to_param}, valid_session
      expect(assigns(:rfid_scan)).to eq(rfid_scan)
    end
  end

  describe "GET #new" do
    it "assigns a new rfid_scan as @rfid_scan" do
      get :new, {}, valid_session
      expect(assigns(:rfid_scan)).to be_a_new(RfidScan)
    end
  end

  describe "GET #edit" do
    it "assigns the requested rfid_scan as @rfid_scan" do
      rfid_scan = RfidScan.create! valid_attributes
      get :edit, {:id => rfid_scan.to_param}, valid_session
      expect(assigns(:rfid_scan)).to eq(rfid_scan)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new RfidScan" do
        expect {
          post :create, {:rfid_scan => valid_attributes}, valid_session
        }.to change(RfidScan, :count).by(1)
      end

      it "assigns a newly created rfid_scan as @rfid_scan" do
        post :create, {:rfid_scan => valid_attributes}, valid_session
        expect(assigns(:rfid_scan)).to be_a(RfidScan)
        expect(assigns(:rfid_scan)).to be_persisted
      end

      it "redirects to the created rfid_scan" do
        post :create, {:rfid_scan => valid_attributes}, valid_session
        expect(response).to redirect_to(RfidScan.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved rfid_scan as @rfid_scan" do
        post :create, {:rfid_scan => invalid_attributes}, valid_session
        expect(assigns(:rfid_scan)).to be_a_new(RfidScan)
      end

      it "re-renders the 'new' template" do
        post :create, {:rfid_scan => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested rfid_scan" do
        rfid_scan = RfidScan.create! valid_attributes
        put :update, {:id => rfid_scan.to_param, :rfid_scan => new_attributes}, valid_session
        rfid_scan.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested rfid_scan as @rfid_scan" do
        rfid_scan = RfidScan.create! valid_attributes
        put :update, {:id => rfid_scan.to_param, :rfid_scan => valid_attributes}, valid_session
        expect(assigns(:rfid_scan)).to eq(rfid_scan)
      end

      it "redirects to the rfid_scan" do
        rfid_scan = RfidScan.create! valid_attributes
        put :update, {:id => rfid_scan.to_param, :rfid_scan => valid_attributes}, valid_session
        expect(response).to redirect_to(rfid_scan)
      end
    end

    context "with invalid params" do
      it "assigns the rfid_scan as @rfid_scan" do
        rfid_scan = RfidScan.create! valid_attributes
        put :update, {:id => rfid_scan.to_param, :rfid_scan => invalid_attributes}, valid_session
        expect(assigns(:rfid_scan)).to eq(rfid_scan)
      end

      it "re-renders the 'edit' template" do
        rfid_scan = RfidScan.create! valid_attributes
        put :update, {:id => rfid_scan.to_param, :rfid_scan => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested rfid_scan" do
      rfid_scan = RfidScan.create! valid_attributes
      expect {
        delete :destroy, {:id => rfid_scan.to_param}, valid_session
      }.to change(RfidScan, :count).by(-1)
    end

    it "redirects to the rfid_scans list" do
      rfid_scan = RfidScan.create! valid_attributes
      delete :destroy, {:id => rfid_scan.to_param}, valid_session
      expect(response).to redirect_to(rfid_scans_url)
    end
  end

end