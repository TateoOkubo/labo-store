class CartController < ApplicationController
  def show
    user = User.find(session[:user_id])
    @cart_items = user.cart.line_items
  end


end
