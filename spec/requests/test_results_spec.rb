require 'rails_helper'

RSpec.describe "TestResults", type: :request do
  let(:user) { create(:user) } 
  let(:sample) { create(:sample) } 
  let(:test_result) { create(:test_result, sample: sample) } 

  before do
    sign_in user
  end

  describe "GET /test_results" do
    it "returns http success" do
      get test_results_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /test_results/new" do
    it "returns http success" do
      get new_test_result_path(sample_id: sample.id)
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /test_results/:id/edit" do
    it "returns http success" do
      get edit_test_result_path(test_result)
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /test_results" do
    context "with valid parameters" do
      let(:valid_params) do
        {
          test_result: {
            result: "Positive",
            sample_id: sample.id
          }
        }
      end

      it "creates a new test result" do
        expect {
          post test_results_path, params: valid_params
        }.to change(TestResult, :count).by(1)
      end

      it "redirects to the referrer" do
        post test_results_path, params: valid_params
        expect(response).to redirect_to(request.referrer || root_url)
      end
    end

    context "with invalid parameters" do
      let(:invalid_params) do
        {
          test_result: {
            result: "",
            sample_id: sample.id
          }
        }
      end

      it "does not create a new test result" do
        expect {
          post test_results_path, params: invalid_params
        }.not_to change(TestResult, :count)
      end

      it "renders the new template" do
        post test_results_path, params: invalid_params
        expect(response).to render_template(:new)
      end
    end
  end

  describe "PATCH /test_results/:id" do
    let(:new_result) { "Negative" }

    it "updates the test result" do
      patch test_result_path(test_result), params: { test_result: { result: new_result } }
      test_result.reload
      expect(test_result.result).to eq(new_result)
    end

    it "redirects to the referrer" do
      patch test_result_path(test_result), params: { test_result: { result: new_result } }
      expect(response).to redirect_to(request.referrer || root_url)
    end
  end

  describe "DELETE /test_results/:id" do
    it "deletes the test result" do
      delete test_result_path(test_result)
      expect(response).to redirect_to(test_results_url)
    end
  end

  describe "GET /test_results/:id/review_result" do
    it "renders the review_result partial" do
      get review_result_test_result_path(test_result)
      expect(response).to render_template(partial: '_review_result')
    end
  end

  describe "GET /test_results/:id/send_results" do
    it "redirects to the referrer with a notice" do
      get send_results_test_result_path(test_result)
      expect(response).to redirect_to(request.referrer || root_url)
      expect(flash[:notice]).to eq('Results were successfully sent.')
    end
  end
end
