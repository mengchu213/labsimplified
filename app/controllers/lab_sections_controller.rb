class LabSectionsController < ApplicationController
  before_action :authenticate_user!
  

  def index
    @lab_sections = LabSection.all
  end


  
  private
  

  def lab_section_params
    params.require(:lab_section).permit(:name)
  end

end
