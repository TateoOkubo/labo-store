class TypesController < ApplicationController
  before_action :admin_user
  
  def new
    @type = Type.new
  end
  
  def create
    @type = Type.new(type_param)
    if @type.save
      flash[:success] = "商品を登録しました"
      render 'new'
    else
      render 'new'
    end
  end
  
  private
  def type_param
    params.require(:type).permit(:name)
  end
end
