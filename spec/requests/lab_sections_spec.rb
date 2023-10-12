require 'rails_helper'

RSpec.describe "LabSections", type: :request do
  let(:user) { create(:user) } 
  let!(:lab_section) { create(:lab_section) } 

  describe "GET /index" do
    context "when user is not signed in" do
      it "redirects to the sign in page" do
        get lab_sections_path
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    context "when user is signed in" do
      before do
        sign_in user
        get lab_sections_path
      end

      it "returns http success" do
        expect(response).to have_http_status(:success)
      end

      it "renders the index template" do
        expect(response).to render_template(:index)
      end

      it "loads the lab sections into @lab_sections" do
        expect(assigns(:lab_sections)).to eq([lab_section])
      end
    end
  end
end
