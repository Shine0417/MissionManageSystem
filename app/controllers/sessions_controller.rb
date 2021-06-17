class SessionsController < ApplicationController
  skip_before_action :check_login, only: %w[create new]

  def new; end

  def create
    if login_success
      redirect_to missions_url, notice: I18n.t('login_success')
    else
      redirect_to root_url, notice: I18n.t('wrong_name_or_password')
    end
  end

  def destroy
    session[:user_id] = nil
    session[:admin_view_user_id] = nil
    redirect_to root_url, notice: I18n.t('logout')
  end

  private

  def login_success
    session[:user_id] = User.authenticate(params[:username], params[:password])
  end
end
