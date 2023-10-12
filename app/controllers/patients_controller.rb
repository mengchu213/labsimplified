class PatientsController < ApplicationController
  before_action :set_patient, only: %i[ show edit update destroy ]
  before_action :authenticate_user!
 

  
  def index
    @patients = Patient.all
    
  end


  def new
    @patient = Patient.new
    @patient.samples.build
    @tests = Test.all
    respond_to do |format|
      format.turbo_stream
      format.html
    end
  rescue => e
    puts "Error: #{e.message}"
  end
  

  def edit
    @patient = Patient.find(params[:id])
  end

  def create
    @patient = Patient.new(patient_params)
    if @patient.save
      redirect_to dashboard_path(active_tab: 'patients'), notice: 'Patient was successfully created.'
    else
      @tests = Test.all
      render :new
    end
  end

  def update
    @patient = Patient.find(params[:id])
      
    if @patient.update(patient_params)
      redirect_to request.referer || dashboard_path, notice: 'Patient was successfully updated.'
    else
      render :edit
    end
  end
  
  
  


  private
  

  def set_patient
    @patient = Patient.find(params[:id])
  end

  def patient_params
    params.require(:patient).permit(:name, :dob, :patient_email, samples_attributes: [:sample_type, :status, :test_id])
  end
  


end
