module SessionsHelper
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    !!current_user
  end
  
  def admin?
    if logged_in?
      current_user.admin
    else
      flash[:danger] = "Please log in."
      redirect_to login_path 
      #redirect_to
    end
    
  end

  def store_location
    session[:forwarding_url] = request.url if request.get?
  end
end
