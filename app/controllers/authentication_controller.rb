require 'httparty'

class AuthenticationController < ApplicationController
  def facebook
    redirect_to ENV['FACEBOOK_AUTH_URL']
  end

  def facebook_return
    if (params[:code])
      if (authenticate_facebook params[:code])
        redirect_to '/users/info'
      else
        redirect_to '/auth/error'
      end
    end
  end

  def authenticate
    if (authenticate!(auth_params[:email], auth_params[:password]))
      redirect_to '/users/info'
    else
      redirect_to '/auth/error'
    end
  end

  private

  def auth_params
    params.permit(
        :email,
        :password
    )
  end
end
