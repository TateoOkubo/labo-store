class SalesController < ApplicationController
  def new
    @sale = Sale.new
    @user = User.find_by(id: session[:user_id])
    @items = @user.cart.line_items
    p "-----------------------"
    p @user
  end
  
  def create
  
  end
end
