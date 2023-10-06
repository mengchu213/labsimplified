class PatientsController < ApplicationController
  before_action :set_patient, only: %i[ show edit update destroy ]
  before_action :authenticate_user!
 

  # GET /patients
  def index
    @patients = Patient.all
    
  end

  # GET /patients/1
  def show
  end

  # GET /patients/new
  def new
    @patient = Patient.new
    @patient.samples.build # Builds an associated sample object
    @tests = Test.all
    respond_to do |format|
      format.turbo_stream
      format.html
    end
  rescue => e
    puts "Error: #{e.message}" # Print any error messages
  end
  

  # GET /patients/1/edit
  def edit
    @patient = Patient.find(params[:id])
  end

  # POST /patients
  def create
    @patient = Patient.new(patient_params)
    if @patient.save
      redirect_to dashboard_path(active_tab: 'patients'), notice: 'Patient was successfully created.'
    else
      @tests = Test.all # To re-render the form with available tests
      render :new
    end
  end

  # PATCH/PUT /patients/1
  def update
    @patient = Patient.find(params[:id])
    
    if @patient.update(patient_params)
      redirect_to request.referer, notice: 'Patient was successfully updated.'
    else
      render :edit
    end
  end
  
  

  # DELETE /patients/1
  def destroy
    @patient.destroy
    redirect_to patients_url, notice: "Patient was successfully destroyed."
  end

  private
  
  # Use callbacks to share common setup or constraints between actions.
  def set_patient
    @patient = Patient.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def patient_params
    params.require(:patient).permit(:name, :dob, :patient_email, samples_attributes: [:sample_type, :status, :test_id])
  end
  

  def ensure_admin
    unless current_user&.admin?
      redirect_to root_path, alert: 'Access denied!'
    end
  end
end
