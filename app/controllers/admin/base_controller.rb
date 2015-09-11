class Admin::BaseController < ApplicationController
  layout "admin"
  before_action :is_admin
  def dashboard
    @users = User.includes(:profile).all
  end

  def missions
    @missions = Mission.includes(:user).all
  end

  private
    def is_admin
      redirect_to root_path if current_admin.nil?
    end
end
