class TestResultsController < ApplicationController
  before_action :set_test_result, only: %i[ show edit update destroy ]
  before_action :authenticate_user!
  before_action :ensure_admin

  # GET /test_results
  def index
    @test_results = TestResult.all
  end

  # GET /test_results/1
  def show
  end

  # GET /test_results/new
  def new
    @sample = Sample.find(params[:sample_id])
    @test_result = TestResult.new(sample: @sample)
  end

  # GET /test_results/1/edit
  def edit
    @test_result = TestResult.find(params[:id])
  end
  
  

  # POST /test_results
  def create
    @test_result = TestResult.new(test_result_params)

    if @test_result.save
      redirect_to @test_result, notice: "Test result was successfully created."
    else
      render :new
    end
  end

  # PATCH/PUT /test_results/1
  def update
    @test_result = TestResult.find(params[:id])
    
    if @test_result.update(test_result_params)
      redirect_to request.referrer || root_url, notice: 'Test result was successfully updated.'
    else
      render :edit
    end
  end
  

  # DELETE /test_results/1
  def destroy
    @test_result.destroy
    redirect_to test_results_url, notice: "Test result was successfully destroyed."
  end
  def review_result
    @test_result = TestResult.find(params[:id])
    render partial: 'review_result', locals: { test_result: @test_result }
  end
  
  
  
  private
  
  # Use callbacks to share common setup or constraints between actions.
  def set_test_result
    @test_result = TestResult.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def test_result_params
    params.require(:test_result).permit(:result, :sample_id)
  end

  def ensure_admin
    unless current_user&.admin?
      redirect_to root_path, alert: 'Access denied!'
    end
  end
end
