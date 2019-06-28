class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def not_authorized
    render file: 'public/401.html', status: :unauthorized
  end

  def check_api_token
    not_authorized if session[:api_token].nil?
  end

  def super_admin_authorized
    not_authorized unless session["role"] == "super_admin"
  end
end
