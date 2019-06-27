require 'petcollab_api/base'

module PetcollabAPI::Users
  include PetcollabAPI::Base

  def create_user(user_params)
    response = HTTParty.post("#{ENV['API_URL']}/users", body: user_params, headers: { 'x-access-token' => session[:api_token] })
    self.process_response response
  end

  def user_info
    response = HTTParty.get("#{ENV['API_URL']}/users/info", headers: { 'x-access-token' => session[:api_token] })
    self.process_response response
  end

  def users_list
    response = HTTParty.get("#{ENV['API_URL']}/admin/users", headers: { 'x-access-token' => session[:api_token] })
    self.process_response response
  end

  def destroy_user(user_id)
    response = HTTParty.delete("#{ENV['API_URL']}/admin/users/#{user_id}", headers: { 'x-access-token' => session[:api_token] })
    self.process_response response
  end
end
