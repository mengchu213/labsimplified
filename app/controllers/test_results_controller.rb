class TestResultsController < ApplicationController
  before_action :set_test_result, only: %i[ show edit update destroy ]
  before_action :authenticate_user!
 

  def index
    @test_results = TestResult.all
  end


  def new
    @sample = Sample.find(params[:sample_id])
    @test_result = TestResult.new(sample: @sample)
  end

  def edit
  end
  
  
  def create
    @test_result = TestResult.new(test_result_params)

    if @test_result.save
      redirect_to request.referer || root_url, notice: "Test result was successfully created."
    else
      render :new
    end
  end

  def update
    
    if @test_result.update(test_result_params)
      redirect_to request.referrer || root_url, notice: 'Test result was successfully updated.'
    else
      render :edit
    end
  end
  

  def destroy
    @test_result.destroy
    redirect_to test_results_url, notice: "Test result was successfully destroyed."
  end
  def review_result
    @test_result = TestResult.find(params[:id])
    render partial: 'review_result', locals: { test_result: @test_result }
  end
  
  def send_results
    @test_result = TestResult.find(params[:id])
    TestResultMailer.send_results(@test_result).deliver_now
    redirect_to request.referrer || root_url, notice: 'Results were successfully sent.'
  end
  
  
  
  
  
  
  
  private
  
  def set_test_result
    @test_result = TestResult.find(params[:id])
  end

  def test_result_params
    params.require(:test_result).permit(:result, :sample_id)
  end

end
