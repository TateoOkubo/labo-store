class PurchasesController < ApplicationController
  def new
    @purchase = Purchase.new
    @purchase.purchase_items.build
  end
  
  def index
    @purchases = Purchase.all
  end
  
  def show
    @purchase = Purchase.find(params[:id])
  end
  
  def create
    @purchase = Purchase.new(user_params)
    #@purchase.purchase_items.build
    p '==========================='
    p user_params

    #binding.pry
    if @purchase.save
      flash[:success] = "仕入れ登録しました"
      redirect_to purchases_path
    else
      render 'new'
    end
    
  end
  
  private
  def user_params
    params.require(:purchase).permit(purchase_items_attributes: [:item_id, :quantity])
  end
end
