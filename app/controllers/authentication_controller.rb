require 'petcollab_api/auth'

class AuthenticationController < ApplicationController
  include PetcollabAPI::Auth
  def authenticate
    if (authenticate!(auth_params[:email], auth_params[:password]))
      redirect_to '/users/info'
    else
      redirect_to '/auth/error'
    end
  end

  private

  def auth_params
    params.require(:auth).permit(:email, :password)
  end
end
