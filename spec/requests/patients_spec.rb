require 'rails_helper'

RSpec.describe "Patients", type: :request do
  let(:user) { create(:user) }
  let!(:patient) { create(:patient) }
  let!(:test) { create(:test) }
  let(:some_test) { create(:test) } 
  let(:some_test_id) { some_test.id }
  
  before do
    sign_in user
  end

  describe "GET /index" do
    it "returns http success" do
      get patients_path
      expect(response).to have_http_status(:success)
    end

    it "renders the index template" do
      get patients_path
      expect(response.body).to include(patient.name)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get new_patient_path
      expect(response).to have_http_status(:success)
    end

    it "renders the new template" do
      get new_patient_path
      expect(response).to render_template(:new)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get edit_patient_path(patient)
      expect(response).to have_http_status(:success)
    end

    it "renders the edit template" do
      get edit_patient_path(patient)
      expect(response).to render_template(:edit)
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      let(:valid_params) do
        {
          patient: {
            name: "John Doe",
            dob: "1990-01-01",
            samples_attributes: [
              {
                sample_type: "Blood",
                status: "completed",
                test_id: some_test_id
              }
            ]
          }
        }
      end
      

      it "creates a new patient" do
        expect {
          post patients_path, params: valid_params
        }.to change(Patient, :count).by(1)
      end

      it "redirects to the dashboard" do
        post patients_path, params: valid_params
        expect(response).to redirect_to(dashboard_path(active_tab: 'patients'))
      end
    end

    context "with invalid parameters" do
      let(:invalid_params) do
        {
          patient: {
            name: "",
            dob: "",
            patient_email: ""
          }
        }
      end

      it "does not create a new patient" do
        expect {
          post patients_path, params: invalid_params
        }.not_to change(Patient, :count)
      end

      it "renders the new template" do
        post patients_path, params: invalid_params
        expect(response).to render_template(:new)
      end
    end
  end

  describe "PUT /update" do
    let(:new_name) { "Jane Doe" }

    it "updates the patient" do
      put patient_path(patient), params: { patient: { name: new_name } }
      patient.reload
      expect(patient.name).to eq(new_name)
    end

    it "redirects to the referrer" do
      put patient_path(patient), params: { patient: { name: "Updated Name" } }, headers: { "HTTP_REFERER" => dashboard_path }

      expect(response).to redirect_to(request.referer)
    end
  end
end
