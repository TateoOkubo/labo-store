class CartController < ApplicationController
  def show
    user = User.find(session[:user_id])
    @cart_items = user.cart.line_items
  end

  def create
    binding.pry
  end
  
  def update
    # カートに追加
    user = User.find(params["id"])
    adding_item = Item.find(params["item_id"])
    user.cart.add(adding_item)
    
    flash[:success] = adding_item.name + "をカートに追加しました"
    
    # カート内を表示
    redirect_to cart_path
    
  end

end
