class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  def admin_user
    unless current_user.admin?
      flash[:danger] =  t("req_admin")
      redirect_to root_url
    end
  end

  def logged_in_user
    unless logged_in?
      store_location
      flash[:warning] = t("req_login")
      redirect_to login_path
    end
  end
end
