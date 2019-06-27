require 'petcollab_api/users'

class Admin::UsersController < ApplicationController
  include PetcollabAPI::Users

  def index
    @users = users_list
  end

  def create
    if user = create_user(user_params)
      confirmation_token = user["confirmation_token"]
      flash[:success] = "User created successfully. Confirmation token: #{confirmation_token}"
      redirect_to admin_users_path
    else
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
    params.require(:user).permit(:name, :email, :password)
  end
end
