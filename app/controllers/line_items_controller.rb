class LineItemsController < ApplicationController
  def update
    p "********************"
    p params
    @update_line_item = LineItem.find(params["id"])
    
    if params[:plus]
      p "plus"
    end
    
    if @update_line_item.update(update_params)
      flash[:success] = '更新完了！'
      redirect_to cart_index_path
    else
      # エラー表示
      flash[:danger] = '更新失敗'
      render 'edit'
    end
  end
  
  private
  def update_params
    params.require(:line_item).permit(:quantity)
  end
  
end
