class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV["ADMIN_USERNAME"], password: ENV["ADMIN_PASSWORD"], except: false
  def show
    @number_of_categories = Category.count(:id)
    @number_of_products = Product.sum(:quantity)
    puts @number_of_products
  end
end
