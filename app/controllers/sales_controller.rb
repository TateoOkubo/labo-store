class SalesController < ApplicationController
  def new
    
    @sale = Sale.new
    @user = User.find_by(id: session[:user_id])
    @items = @user.cart.line_items
    p "-----------------------"
    p @user
    
    
  end
  
  def create
    @user = User.find_by(id: session[:user_id])
    @sale = Sale.new(user_id: @user.id)
    @items = @user.cart.line_items
    
    @items.each do |i|
      # 個数のチェックは必要?
      @sale.sale_items.new(item_id: i.id, quantity: i.quantity)
    end
    
    if @sale.save
      # line_itemsを消す必要がある
      flash[:success] = "購入しました"
      redirect_to new_sale_path
    else
      render 'new'
    end
    
    #binding.pry
    
  end
  
  private
  def sales_params
    
  end
end
