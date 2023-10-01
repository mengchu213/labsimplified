class PagesController < ApplicationController
  before_action :authenticate_user!, only: [:dashboard]
  def home
  end
  def dashboard
    @active_tab = params[:active_tab] || 'lab_sections'
    @lab_sections = LabSection.includes(:tests).all if @active_tab == 'lab_sections'
    @patients = Patient.all if @active_tab == 'patients'
    @samples = Sample.all if @active_tab == 'samples'
    @test_results = TestResult.all if @active_tab == 'test_results'
    @active_test = params[:active_test]
  end
  
  
end
