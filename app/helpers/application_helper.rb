module ApplicationHelper
  def make_signup
    if session[:user_id].blank?
      @signup_text = "Sign Up"
      @signup_url = new_user_path
    else
      @user = User.find(session[:user_id])
      @signup_text = "#{@user.name}'s profile"
      @signup_url = user_url(@user)
    end
  end

  def make_login
    if session[:user_id].blank?
      @login_text = "Log in"
      @login_url = signin_path
      @method = "get"
    else
      @login_text = "Log Out"
      @login_url = sessions_path
      @method = "delete"
    end
  end
end
