class Admin::UsersController < ApplicationController
  before_action :admin_user, only: [:index, :destroy]

  def index
    WillPaginate.per_page = Settings.per_page
    @users = User.paginate(page: params[:page]).order("id DESC")
  end

  def destroy
    @user = User.find_by(id: params[:id])
    if @user.destroy
      flash[:success] = t("user.delete_success")
    else
      flash[:error] = t("user.delete_fail")
    end
    redirect_to admin_users_path
  end
end
