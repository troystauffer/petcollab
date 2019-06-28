require 'petcollab_api/base'

module PetcollabAPI::Auth
  include PetcollabAPI::Base

  def auth(email, password)
    @api = HTTParty.post(ENV['API_URL'] + '/auth', body: { email: email, password: password })
    if (@api.code < 400)
      session[:api_token] = @api['response']['token']
      session[:role] = @api['response']['role']['title']
    end
  end
end
