class UsersController < ApplicationController
  before_action :authenticate_user!, :is_admin?, only: [:show, :edit]

  def show
    @user = User.find(params[:id])
  end

  def edit
  end

  private

  def is_admin? ### A METTRE DS LES HELPERS?
    unless current_user.id.to_i == params[:id].to_i
      redirect_to new_user_session_path
    end
  end

end
