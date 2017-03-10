class LineItemsController < ApplicationController
  def update
    p "********************"
    p params
    @update_line_item = LineItem.find(params["id"])
    
    if params[:plus]
      p "plus"
    end
    
    p update_params[:quantity]
    
    if update_params[:quantity].to_i == 0
      flash[:success] = '商品削除しました'
      p "---- delete!!! (@update_line_item.id) ----"
      p @update_line_item.id
      LineItem.delete(@update_line_item.id)
      redirect_to cart_index_path
    elsif @update_line_item.update(update_params)
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
