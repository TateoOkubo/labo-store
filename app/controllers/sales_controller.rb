class SalesController < ApplicationController
  def new
    
    @sale = Sale.new
    @user = User.find_by(id: session[:user_id])
    @items = @user.cart.line_items
    p "-----------------------"
    p @user
    p ""
    p @items
    p "-----------------------"
    
  end
  
  def create
    @user = User.find_by(id: session[:user_id])
    @sale = Sale.new(user_id: @user.id)
    @items = @user.cart.line_items
    
    p "-----create---------"
    p @user
    p ""
    p @items
    p "-----------------------"
    
    out_of_stock = []
    
    @items.each do |i|
      # 個数のチェックは必要?
      #binding.pry
      if (i.item.stock - i.quantity) >= 0
        #i.id -> i.item_id これがバグ
        @sale.sale_items.new(item_id: i.item_id, quantity: i.quantity)
      else
        #在庫不足している商品名を記録
        out_of_stock << i.name
        
      end
    end
    
    #binding.pry
    
    if out_of_stock.count > 0
      flash[:alert] = out_of_stock.join(",") + "の在庫が不足してます"
      redirect_to new_sale_path
    elsif @sale.save
      # line_itemsを消す必要がある
      @items.destroy_all
      
      flash[:success] = "購入しました"
      # メール送信
      NoticeMailer.buy(@user.email, @sale).deliver
      
      redirect_to new_sale_path
    else
      render 'new'
    end
    #end
  end
  
  def index
    @sales = Sale.where(user_id: session[:user_id])
    
    p "-------sales_countoller:index------------"
    p @sales
  end

end
