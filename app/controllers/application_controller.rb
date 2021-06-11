class ApplicationController < ActionController::Base
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  before_action :set_locale
  before_action :check_login
  
  private

  def set_locale
    session[:locale] = params[:locale] if params[:locale] && I18n.available_locales.include?(params[:locale].to_sym)

    I18n.locale = session[:locale] || I18n.default_locale
  end

  def check_login
    redirect_to root_url, notice: t('please_login') if User.find(session[:user_id]).nil?
  end

  def record_not_found
    redirect_to root_url, notice: "Cant find user id"
  end
end
