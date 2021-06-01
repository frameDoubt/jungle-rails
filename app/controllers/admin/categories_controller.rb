class Admin::CategoriesController < ApplicationController
  def index
    @categories = Category.order(:name).all
    # raise @categories.inspect

  end
end
