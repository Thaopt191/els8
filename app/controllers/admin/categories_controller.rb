class Admin::CategoriesController < ApplicationController
  before_action :logged_in_user
  before_action :admin_user

  def index
    WillPaginate.per_page = Settings.per_page
    @categories = Category.paginate(page: params[:page]).order('name')
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to @category
      flash[:success] = t "category.create.success"
    else
      flash[:error] = t "category.create.fail"
      render "new"
    end
  end

  def edit
    @category = Category.find_by(id: params[:id])
  end

  def update
    @category = Category.find_by(id: params[:id])
    if @category.update_attributes(category_params)
      flash[:success] = t("category.update-success")
      redirect_to @category
    else
      flash[:warning] = t("user.update_fail")
      render "edit"
    end

  end

  def destroy
    @category = Category.find_by(id: params[:id])
    if @category.destroy
      flash[:success] = t "category.deleted"
    else
      flash[:error] = t("user.delete_fail")
    end
      redirect_to admin_categories_url
  end

  private
  def category_params
    params.require(:category).permit(:name, :description)
  end
end
