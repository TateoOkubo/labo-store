class ItemsController < ApplicationController
  before_action :admin_user, only: [:edit, :create, :update, :shortage]
  
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
    puts "*************items edit*********************"
    p @item # pにすること
    puts "*************items edit end***********************"
  end
  
  # 更新処理
  def update
    @update_item = Item.find(params[:id])
    p "^^^^^ items update ^^^^^"
    p item_update_params
    
    p ","
    p @update_item
    p "next --> params"
    p params
    p "^^^^^^^^^^^^^^^^^^^^^^^^^"
    
    #binding.pry
    if @update_item.update(item_update_params)
      p "   updating ... !!"
      @update_item.image = params.require(:item).permit(:image)
      p @update_item.image
      p "改行"
      p params.require(:item).permit(:image)
      
      flash[:success] = '更新完了！'
      p "^^^^ update success ^^^^"
      redirect_to (item_path)
    else
      # エラー表示
      flash[:danger] = '更新失敗'
      p "^^^^^ update faiure ^^^^"
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
  
  def shortage
    #在庫不足しているものを表示
    @shortage = shortage_items(3).sort_by{|v| v.stock}
    
  end
  
  def search_shortage
    p "^^^^^^^^^^^^^^^^^^^^^^^"
    p params
    
    @shortage = shortage_items(params[:q].to_i).sort_by{|v| v.stock}
    render 'shortage'
  end
  
  private
  
  def item_regist_params
    params.require(:item).permit(:name, :type_id, :price)
  end
  
  def item_update_params
    params.require(:item).permit(:name, :type_id, :price)
  end
  
  # 在庫がnum以下の商品を取り出す
  def shortage_items(num)
    if num != nil
      Item.all.find_all{|v| v.stock <= num}
    else
      Item.all
    end
  end
  
end
