require 'petcollab_api/base'

module PetcollabAPI::Auth
  include PetcollabAPI::Base
  def authenticate!(email, password)
    auth('/auth', { email: email, password: password })
  end

  private

  def auth(path, body)
    response = HTTParty.post(ENV['API_URL'] + path, body: body)
    session[:api_token] = body['token'] if (body = process_response response)
  end
end
