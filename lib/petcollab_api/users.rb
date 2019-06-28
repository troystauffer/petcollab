require 'petcollab_api/base'

module PetcollabAPI::Users
  include PetcollabAPI::Base

  def create_user(user_params)
    @api = HTTParty.post("#{ENV['API_URL']}/users", body: user_params, headers: { 'x-access-token' => session[:api_token] })
  end

  def user_info
    @api = HTTParty.get("#{ENV['API_URL']}/users/info", headers: { 'x-access-token' => session[:api_token] })
  end

  def users_list
    @api = HTTParty.get("#{ENV['API_URL']}/admin/users", headers: { 'x-access-token' => session[:api_token] })
  end

  def destroy_user(user_id)
    @api = HTTParty.delete("#{ENV['API_URL']}/admin/users/#{user_id}", headers: { 'x-access-token' => session[:api_token] })
  end
end
