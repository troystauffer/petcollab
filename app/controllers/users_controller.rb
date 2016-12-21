class UsersController < ApplicationController
  before_action :check_api_token
  def info
    @info = user_info
  end
end
