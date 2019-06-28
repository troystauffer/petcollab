require 'petcollab_api/users'

class Admin::UsersController < ApplicationController
  include PetcollabAPI::Users

  before_action :set_user, only: %i(new create)
  before_action :super_admin_authorized

  def index
    users_list
    @users = @api["response"]
  end

  def create
    create_user(user_params)
    if @api["success"]
      confirmation_token = @api["response"]["confirmation_token"]
      flash[:success] = "User created successfully. Confirmation token: #{confirmation_token}"
      redirect_to admin_users_path
    else
      flash[:error] = "User creation failed: "
      @api["errors"].each { |e| flash[:error] += " #{e["msg"]}" }
      render :new
    end
  end

  def destroy
    if destroy_user(params[:id])
      flash[:success] = "User deleted."
    else
      flash[:error] = "An error occurred. The user was not deleted."
    end
    redirect_to admin_users_path
  end

  private

  def user_params
    params.permit(:name, :email, :password)
  end

  def set_user
    @user = { name: user_params[:name], email: user_params[:email], password: user_params[:password] }
  end
end
