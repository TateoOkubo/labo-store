class ItemsController < ApplicationController
  
  
  def index
    #@items = Item.all
    @i        = Item.search(params[:q])
    @items = @i.result(distinct: true)
  end
  
  def register
    # adminか確認する
    #if logged_in? && admin?
      @item = Item.new
    #else
    #  redirect_to root_path
    #end
    
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
  
  
  
  def ranking
    #have_rank =  Have.group(:item_id).order('count_all desc').limit(10).count

    #@items = Item.find(have_rank.keys).sort_by{ |o| have_rank.keys.index(o.id) }
    #@ranks = have_rank.values
    #売上が多い順に表示
    #map{|m| m.quantity}.sum
    @ranking = Item.all.sort_by{|x| x.sumQuantity }.reverse
    @sum = @ranking.map{|m| m.sumQuantity}
  end
  
  private
  
  def item_regist_params
    params.require(:item).permit(:name, :type_id, :price)
  end
  
  def item_update_params
    params.require(:item).permit(:image, :name, :type_id, :price)
  end
  
end
