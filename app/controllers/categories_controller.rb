class CategoriesController < ApplicationController
  def index
  	WillPaginate.per_page = Settings.per_page
    @categories = Category.paginate(page: params[:page]).order('name')
  end

  def show
    @category = Category.find_by(id: params[:id])
    @words = @category.words.paginate(page: params[:page])
  end
end
