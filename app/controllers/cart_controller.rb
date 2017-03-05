class CartController < ApplicationController
  before_action :logged_in_user
  
  def show
    redirect_to :action => 'index'
    #user = User.find(session[:user_id])
    #@cart_items = user.cart.line_items
    #@cart = user.cart
  end

  def create
    
  end
  
  def update
    p "--------- cart_controlle update ------"
    # カートに追加
    user = current_user #User.find(params["id"])
    adding_item = Item.find(params["item_id"])
    user.cart.add(adding_item)
    
    flash.now[:success] = adding_item.name + "をカートに追加しました"
    
    params[:to_cart] = true
    # カート内を表示
    @cart_items = user.cart.line_items
    @cart = user.cart
    render 'show'
    #redirect_to :action => 'index'
    
    p params
  end
  
  def edit
    
  end
  
  def index
    user = User.find(session[:user_id])
    @cart_items = user.cart.line_items
    @cart = user.cart
    render 'show'
  end
  
  
end
