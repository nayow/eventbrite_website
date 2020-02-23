class UsersController < ApplicationController

  ### is_admin as in "is owner", not website admin!
  before_action :authenticate_user!, :check_if_admin_or_owner, only: [:show]


  def show
    @user = User.find(params[:id])
  end

  def edit
  end

  private

  def check_if_admin_or_owner
    if current_user.is_admin then true
    elsif current_user.is_owner? then true
    else
      flash[:error] = "Réservé aux administrateurs"
      redirect_to user_path(current_user.id)
    end
  end

  def is_owner? ### helper???
    current_user.id.to_i == params[:id].to_i
  end

end
