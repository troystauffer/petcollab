require 'net/http'

class AuthenticationController < ApplicationController
  def facebook
    redirect_to ENV['FACEBOOK_AUTH_URL']
  end

  def facebook_return
    if (params[:code])
      url = URI.parse(ENV['API_FACEBOOK_TOKEN_URL'])
      res = Net::HTTP.post_form(url, { "code" => params[:code] })
      body = JSON.parse(res.body)
      session[:api_token] = body['token'] if (body['token'])
      redirect_to '/users/info'
    end
  end
end
