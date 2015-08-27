class Users::MissionsController < Users::BaseController
  def new
    @mission = Mission.new
  end

  def create
    @mission = current_user.missions.build(mission_params)
    if @mission.save
      sign_out current_user
      redirect_to successfully_registered_path
    else
      render :new
    end
  end

  private
  def mission_params
    params[:mission].permit(:address, :landlord_phone, :url, :note)
  end
end
