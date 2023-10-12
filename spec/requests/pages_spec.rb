require 'rails_helper'

RSpec.describe "Pages", type: :request do
  let(:user) { create(:user) }
  let!(:lab_section) { create(:lab_section) }
  let!(:patient) { create(:patient) }
  let!(:sample) { create(:sample) }
  let!(:test_result) { create(:test_result) }

  describe "GET /home" do
    context "when user is not signed in" do
      it "returns http success" do
        get root_path
        expect(response).to have_http_status(:success)
      end
    end

    context "when user is signed in" do
      before { sign_in user }

      it "redirects to dashboard" do
        get root_path
        expect(response).to redirect_to(dashboard_path)
      end
    end
  end

  describe "GET /dashboard" do
    context "when user is not signed in" do
      it "redirects to login page" do
        get dashboard_path
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    context "when user is signed in" do
      before { sign_in user }

      it "returns http success" do
        get dashboard_path
        expect(response).to have_http_status(:success)
      end

      
    end
  end
end
