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
    puts "*********************************************"
    p @item # pにすること
    puts "*********************************************"
  end
  
  def edit
    @item = Item.find(params[:id])
    puts "*********************************************"
    p @item # pにすること
    puts "*********************************************"
  end
  
  # 更新処理
  def update
    @update_item = Item.find(params["id"])
    if @update_item.update(item_update_params)
      flash[:success] = '更新完了！'
      redirect_to (item_path)
    else
      # エラー表示
      flash[:danger] = '更新失敗'
      render 'edit'
    end
  end
  
  private
  
  def item_regist_params
    params.require(:item).permit(:name, :type_id, :price)
  end
  
  def item_update_params
    params.require(:item).permit(:image, :name, :type_id, :price)
  end
  
end
