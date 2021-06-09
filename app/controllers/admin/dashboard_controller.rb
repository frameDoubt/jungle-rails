class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV["ADMIN_USERNAME"], password: ENV["ADMIN_PASSWORD"], except: false
  def show
    @number_of_categories = Product.all.sum
    puts @number_of_categories
  end
end
