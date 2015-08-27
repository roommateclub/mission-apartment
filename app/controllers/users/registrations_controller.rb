class Users::RegistrationsController < Devise::RegistrationsController
before_filter :configure_sign_up_params, only: [:create, :trial_registration]
# before_filter :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  def new
    @profile = Profile.new
    @mission = Mission.new
    super
  end

  # POST /resource
  # def create
  #   super
  # end

  def trial_registration
    @user = User.new(sign_up_params)
    if @user.set_default_password
      SystemMailer.welcome.delever
      redirect_to successfully_registered_path
    else
      resource = User.new(sign_up_params)
      # @profile = resource.profile(sign_up_params[:profile_attributes])
      # @mission = resource.missions(sign_up_params[:missions_attributes]["0"])
      render :new
    end
  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.for(:sign_up) {|u| u.permit(:email, profile_attributes: [:phone, :username], 
      missions_attributes: [:address, :landlord_phone, :url, :note])}
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.for(:account_update) << :attribute
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
