class Users::MissionsController < Users::BaseController
  def new
    @mission = Mission.new
  end

  def create
    @mission = Mission.new(mission_params)
    if @mission.save
      @mission.update(client: current_user)
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
