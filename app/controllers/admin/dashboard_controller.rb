class Admin::DashboardController < ApplicationController
  def show
    @product = Product.all
    @total = Product.sum(:quantity)
    @category = Category.count
  end
end
