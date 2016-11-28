class UsersController < ApplicationController
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
end
