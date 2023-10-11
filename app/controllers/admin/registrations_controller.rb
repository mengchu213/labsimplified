class Admin::RegistrationsController < Devise::RegistrationsController
  before_action :set_user, only: [:edit, :update, :destroy]
  skip_before_action :require_no_authentication, only: [:new, :create]
  before_action :redirect_if_not_admin, only: [:new, :create]

  def create
    build_resource(sign_up_params)

    resource.save
    yield resource if block_given?
    if resource.persisted?
      if resource.active_for_authentication?
        set_flash_message! :notice, :signed_up
      else
        set_flash_message! :notice, :"signed_up_but_#{resource.inactive_message}"
      end
      redirect_to dashboard_path
    else
      clean_up_passwords resource
      set_minimum_password_length
      respond_with resource
    end
  end

  def edit
    # Your edit logic here (if any)
  end

  def update
    if @user.update(user_params)
      redirect_to dashboard_path, notice: 'User was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to dashboard_path, notice: 'User was successfully deleted.'
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
  
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :name, :role)
  end

  def redirect_if_not_admin
    unless current_user&.admin?
      redirect_to dashboard_path, alert: "Only admins can add new users."
    end
  end
end
