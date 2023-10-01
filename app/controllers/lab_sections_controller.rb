class LabSectionsController < ApplicationController
  before_action :set_lab_section, only: %i[ show edit update destroy ]
  before_action :authenticate_user!
  before_action :ensure_admin

  # GET /lab_sections
  def index
    @lab_sections = LabSection.all
  end

  # GET /lab_sections/1
  def show
  end

  # GET /lab_sections/new
  def new
    @lab_section = LabSection.new
  end

  # GET /lab_sections/1/edit
  def edit
  end

  # POST /lab_sections
  def create
    @lab_section = LabSection.new(lab_section_params)

    if @lab_section.save
      redirect_to @lab_section, notice: "Lab section was successfully created."
    else
      render :new
    end
  end

  # PATCH/PUT /lab_sections/1
  def update
    if @lab_section.update(lab_section_params)
      redirect_to @lab_section, notice: "Lab section was successfully updated."
    else
      render :edit
    end
  end

  # DELETE /lab_sections/1
  def destroy
    @lab_section.destroy
    redirect_to lab_sections_url, notice: "Lab section was successfully destroyed."
  end
  
  def some_admin_action
    # Admin only action
  end
  
  private
  
  # Use callbacks to share common setup or constraints between actions.
  def set_lab_section
    @lab_section = LabSection.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def lab_section_params
    params.require(:lab_section).permit(:name)
  end

  def ensure_admin
    unless current_user&.admin?
      redirect_to root_path, alert: 'Access denied!'
    end
  end
end
