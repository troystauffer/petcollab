require 'PetcollabApi'

class ApplicationController < ActionController::Base
  include PetcollabAPI
  protect_from_forgery with: :exception

  def not_authorized
    render file: 'public/401.html', status: :unauthorized
  end

  def check_api_token
    not_authorized if session[:api_token].nil?
  end
end
