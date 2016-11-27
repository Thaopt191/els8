class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update, :index]
  before_action :correct_user, only: [:edit, :update, :show]

  def show
    @user = User.find_by id: params[:id]
  end

  def index
    WillPaginate.per_page = Settings.per_page
    @users = User.paginate(page: params[:page]).order("id DESC")
  end
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = t("user.successCreate")
      redirect_to root_path
    else
      render "new"
    end
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find_by(id: params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = t("user.update_success")
      redirect_to @user
    else
      flash[:warning] = t("user.update_fail")
      render "edit"
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def logged_in_user
    unless logged_in?
      store_location
      flash[:warning] = t("req_login")
      redirect_to login_path
    end
  end

  def correct_user
    @user = User.find(params[:id])
    if !correct_user?(@user) 
      flash[:warning] = t("wrong_user")
      redirect_to current_user
    end
  end
end
