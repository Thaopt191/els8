class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  def admin_user
    unless current_user.admin?
      flash[:danger] =  t("req_admin")
      redirect_to root_url
    end
  end
end
