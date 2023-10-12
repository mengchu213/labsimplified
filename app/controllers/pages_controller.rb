class PagesController < ApplicationController
  before_action :authenticate_user!, only: [:dashboard]
  before_action :redirect_if_logged_in, only: [:home]
  def home
  end
  def dashboard
    @active_tab = params[:active_tab] || 'lab_sections'
    @lab_sections = LabSection.includes(:tests).all if @active_tab == 'lab_sections'
    @patients = Patient.all if @active_tab == 'patients'
    @samples = Sample.all if @active_tab == 'samples'
    @test_results = TestResult.all if @active_tab == 'test_results'
    @active_test = params[:active_test]
    if @active_tab == 'users'
      @users = User.all
    end
    @users = User.all if current_user.role == "admin"
  end
  private

  def redirect_if_logged_in
    if user_signed_in?
      redirect_to dashboard_path 
    end
  end
  
end
