# class SamplesController < ApplicationController
#   before_action :set_sample, only: %i[ show edit update destroy ]
#   before_action :authenticate_user!


#   # GET /samples
#   def index
#     @samples = Sample.all
#   end

#   # GET /samples/1
#   def show
#   end

#   # GET /samples/new
#   def new
#     @sample = Sample.new
#   end

#   # GET /samples/1/edit
#   def edit
#   end

#   # POST /samples
#   def create
#     @sample = Sample.new(sample_params)

#     if @sample.save
#       redirect_to @sample, notice: "Sample was successfully created."
#     else
#       render :new
#     end
#   end

#   # PATCH/PUT /samples/1
#   def update
#     if @sample.update(sample_params)
#       redirect_to @sample, notice: "Sample was successfully updated."
#     else
#       render :edit
#     end
#   end

#   # DELETE /samples/1
#   def destroy
#     @sample.destroy
#     redirect_to samples_url, notice: "Sample was successfully destroyed."
#   end

#   private
  
#   # Use callbacks to share common setup or constraints between actions.
#   def set_sample
#     @sample = Sample.find(params[:id])
#   end

#   # Only allow a list of trusted parameters through.
#   def sample_params
#     params.require(:sample).permit(:sample_type, :status, :test_id, :patient_id)
#   end

#   def ensure_admin
#     unless current_user&.admin?
#       redirect_to root_path, alert: 'Access denied!'
#     end
#   end
# end
