class Users::BaseController < ApplicationController
  before_action :is_user

  
  private
    def is_user
      if params[:token].present? && User.find_by(token: params[:token]).present?
        sign_in(User.find_by(token: params[:token]))
      elsif current_user.present?
        true
      else
        redirect_to root_path
      end
    end
end
