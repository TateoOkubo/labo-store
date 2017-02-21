class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def show
    
    # 現状はrootへ
    redirect_to root_path
  end
  
  def create
    @user = User.new(user_params)
    @user.cart = Cart.create()
    if @user.save
      flash[:success] = "ユーザ登録完了!"
      # ユーザ登録するとログインする
      session[:user_id] = @user.id
      redirect_to @user
    else
      render 'new'
    end
  end
  
  def buy
    @user = User.find(params[:id])
    @items = @user.cart.line_items
    p "-----------------------"
    p @items
  end
  
  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
