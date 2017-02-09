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
    # nameに重複が無いかチェックするか? --> バリデーションで
    if @item.save
      render root_path
    else
      render root_path
    end
    
  end
  
  private
  
  def item_regist_params
    params.require(:item).permit(:name, :type_id, :price)
  end
  
end
