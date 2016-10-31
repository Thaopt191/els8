class CategoriesController < ApplicationController
	before_action :admin_user, only: [:new, :destroy]
  def index
  	@categories = Category.paginate(page: params[:page],:per_page => 10).order('name ASC')
  end

  def new
  	@category=Category.new
  end

  def show
    @category=Category.find(params[:id])
  	@words = @category.words.paginate(page: params[:page])
  end 

  def create
  	@category=Category.new(category_params)
  	if @category.save
  		redirect_to @category
  		flash[:success] = t "category.create.success"
  	else 
  		flash[:danger] = t "category.create.fail"
  		render "new"
  	end
  end

  def destroy
    Category.find(params[:id]).destroy
    flash[:success] = t "category.deleted"
    redirect_to categories_url
  end

private 
	def category_params
		params.require(:category).permit(:name, :description)
	end
	# Before filters

  # Confirms an admin user.
  def admin_user
    redirect_to(root_url) unless current_user.isAdmin?
  end
end

