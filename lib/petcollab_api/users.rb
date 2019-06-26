require 'petcollab_api/base'

module PetcollabAPI::Users
  include PetcollabAPI::Base
  def user_info
    return false unless session[:api_token]
    response = HTTParty.get("#{ENV['API_URL']}/users/info", headers: { 'x-access-token' => session[:api_token] })
    self.process_response response
  end
end
