class ItemsController < ApplicationController
  def index
    @items = Item.all
  end
  
  def register
    @item = Item.new
  end 
  
  def create
    #binding.pry
    @item = Item.new(item_regist_params)
    
    # TODO:保存が完了したかどうかをフラッシュメッセージで表示させるか
    if @item.save
      flash[:success] = "商品を登録しました"

      render 'register'
    else
      render 'register'
    end
    
  end
  
  def show
    @item = Item.find(params[:id])
  end
  
  private
  
  def item_regist_params
    params.require(:item).permit(:name, :type_id, :price)
  end
  
end
