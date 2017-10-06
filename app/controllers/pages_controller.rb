class PagesController < ApplicationController
  load_and_authorize_resource class: :false
  before_action :set_user, only: [:admin, :visitor]

  def dashboard
    @user = User.all
  end

  def admin
    @user.update(role: 0)
    redirect_to root_path
  end

  def visitor
    @user.update(role: 1)
    redirect_to root_path
  end

  private
  def set_user
    @user = User.find(params[:user_id])
  end
end
