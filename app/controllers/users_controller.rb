class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def show
    
    # 現状はrootへ
    redirect_to root_path
  end
end
