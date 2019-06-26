require 'petcollab_api/users'

class UsersController < ApplicationController
  include PetcollabAPI::Users

  before_action :check_api_token

  def info
    @info = user_info
  end
end
