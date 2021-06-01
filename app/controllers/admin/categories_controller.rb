class Admin::CategoriesController < ApplicationController
  def index
    @categories = Category.all.order(:name)
    # raise @categories.inspect
  end
  def new
    @category = Category.new
  end
  def create
    @category = Category.new(category_params)
  end

  private

  def product_params
    params.require(:category).permit(
      :name
    )
  end

end
