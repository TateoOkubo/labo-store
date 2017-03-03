class UsersController < ApplicationController
  before_action :logged_in_user, only: [:destroy, :edit, :show]
  #before_action :correct_user,   only: [:edit, :update, :show]
  
  def new
    @user = User.new
  end
  
  def show
    if correct_user? 
      @user = User.find(params[:id])
      # 現状はrootへ
      #redirect_to root_path
    else
      # 強制的に自分のページへ
      redirect_to current_user
    end
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
  
  def edit
    if correct_user? 
      @user = User.find(params[:id])
    else
      flash[:error] = "自分のみを編集可能です"
      redirect_to current_user
    end
  end
  
  def update
    
    redirect_to user_path
  end
  
  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
  
  def correct_user?
    @user = User.find(params[:id])
    return @user == current_user
  end
end
