class Admin::CategoriesController < ApplicationController
  before_action :admin_user, only: [:new, :index, :create, :destroy]
  
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
