class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_action :authenticate
  protect_from_forgery with: :exception
  before_action :tracker

  protected
    def authenticate
      if params[:controller].include?("admin")
        authenticate_or_request_with_http_basic do |username, password|
          username == Rails.application.secrets.admin_name && password == Rails.application.secrets.admin_password
        end
      end
    end
end
