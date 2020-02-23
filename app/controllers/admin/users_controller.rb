class Admin::UsersController < ApplicationController

  before_action :authenticate_user!, :check_if_admin

  def index
    @all_users = User.all
  end

  def new
  end

  def show
    redirect_to user_path(params[:id])
  end

  def create
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
  end

  def destroy
    User.destroy(params[:id])
    redirect_to admin_root_path
  end

  private

  def check_if_admin
    unless current_user.is_admin
      flash[:error] = "Réservé aux administrateurs"
      redirect_to user_path(current_user.id)
    end
  end

end
