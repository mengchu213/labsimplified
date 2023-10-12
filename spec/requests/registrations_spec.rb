require 'rails_helper'

RSpec.describe "Admin::Registrations", type: :request do
  let(:admin) { create(:user, role: :admin) }
  let(:user) { create(:user, role: :medtech, name: "Original Name") }


 

  describe "POST /create" do
    context "when logged in as admin" do
      before do
        post user_session_path, params: { user: { email: admin.email, password: admin.password } }
      end
      

      context "with valid parameters" do
        let(:valid_params) { { user: attributes_for(:user) } }

        it "creates a new user" do
          expect {
            post user_registration_path, params: valid_params
          }.to change(User, :count).by(1)
        end

        it "redirects to the dashboard" do
          post user_registration_path, params: valid_params
          expect(response).to redirect_to(dashboard_path)
        end
      end

      context "with invalid parameters" do
        let(:invalid_params) { { user: attributes_for(:user, email: "") } }

        it "does not create a new user" do
          expect {
            post user_registration_path, params: invalid_params
          }.not_to change(User, :count)
        end

        it "renders the 'new' template" do
          post user_registration_path, params: invalid_params
          

        end
      end
    end

    context "when not logged in as admin" do
      before do
        post user_session_path, params: { user: { email: user.email, password: user.password } }
      end
      

      it "redirects to the dashboard with an alert" do
        post user_registration_path, params: { user: attributes_for(:user) }
        expect(response).to redirect_to(dashboard_path)

      end
    end
  end

  describe "GET /edit" do
    context "when logged in as admin" do
      before do
        post user_session_path, params: { user: { email: admin.email, password: admin.password } }
      end
      

      it "renders the edit template" do
        get edit_user_registration_admin_path(user)
        expect(response).to have_http_status(:ok)

      end
    end

    context "when not logged in as admin" do
      before do
        post user_session_path, params: { user: { email: user.email, password: user.password } }
      end
      

      it "redirects to the dashboard with an alert" do
        get edit_user_registration_admin_path(user)
        expect(response).to redirect_to(dashboard_path)
        expect(flash[:alert]).to eq("Only admins can add new users.")

      end
    end
  end

  describe "PATCH /update" do
    context "when logged in as admin" do
      before do
        sign_in admin
      end
  
      context "with valid parameters" do
        let(:new_attributes) { { user: { name: "Updated Name" } } }
  
        it "updates the user" do
          patch "/users/#{user.id}", params: new_attributes
          user.reload
          expect(user.name).to eq("Updated Name")
        end
  
        it "redirects to the dashboard" do
          patch "/users/#{user.id}", params: new_attributes
          expect(response).to redirect_to(dashboard_path)
        end
      end
  
      context "with invalid parameters" do
        it "does not update the user" do
          patch "/users/#{user.id}", params: { user: { name: "" } }
          user.reload
          expect(user.name).to eq("Original Name")
        end
        
  
        it "renders the 'edit' template" do
          patch "/users/#{user.id}", params: { user: { name: "" } }
          expect(response).to have_http_status(:ok)
        end
      end
    end
  
    context "when not logged in as admin" do
      before do
        post user_session_path, params: { user: { email: user.email, password: user.password } }
      end
  
      it "redirects to the dashboard with an alert" do
        patch "/users/#{user.id}", params: { user: { name: "Updated Name" } }
        expect(response).to redirect_to(dashboard_path)
      end
    end
  end
  
  
  describe "DELETE /destroy" do
    context "when logged in as admin" do
      before do
        post user_session_path, params: { user: { email: admin.email, password: admin.password } }
      end
      

      it "deletes the user" do
        user_to_delete = create(:user)
        expect {
          delete destroy_user_admin_path(user_to_delete)
        }.to change(User, :count).by(-1)
      end

      it "redirects to the dashboard" do
        user_to_delete = create(:user)
        delete destroy_user_admin_path(user_to_delete)
        expect(response).to redirect_to(dashboard_path)
      end
    end

    context "when not logged in as admin" do
      before do
        post user_session_path, params: { user: { email: user.email, password: user.password } }
      end
      

      
    end
  end
end
