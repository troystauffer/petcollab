require 'petcollab_api/auth'

class AuthenticationController < ApplicationController
  include PetcollabAPI::Auth
  def authenticate
    auth(auth_params[:email], auth_params[:password])
    if (@api["success"])
      redirect_to '/users/info'
    else
      flash[:error] = "Login failed: "
      @api["errors"].each { |e| flash[:error] += " #{e["msg"]}" }
      redirect_to '/auth'
    end
  end

  private

  def auth_params
    params.require(:auth).permit(:email, :password)
  end
end
