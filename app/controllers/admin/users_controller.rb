class Admin::UsersController < ApplicationController
  before_action :find_user_by_id, only: %i[edit update destroy show]
  before_action :check_permission
  skip_before_action :check_login, only: %i[new create]

  def index
    @users = User.all.page(params[:page])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to admin_users_url, notice: I18n.t(:create_user, scope: :notice)
    else
      render :new
    end
  end

  def destroy
    @user.destroy

    redirect_to admin_users_url, notice: I18n.t(:destroy_user, scope: :notice)
  end

  def edit; end

  def update
    if @user.update(user_params)
      redirect_to admin_users_url, notice: I18n.t(:update_user, scope: :notice)
    else
      render :edit
    end
  end

  def show
    @missions = @user.mission.includes(:tags).page(params[:page])
  end

  private

  def find_user_by_id
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :password, :role)
  end

  def check_permission
    redirect_to root_url, notice: t('permission_denied') if User.find(session[:user_id]).user?
  end
end
