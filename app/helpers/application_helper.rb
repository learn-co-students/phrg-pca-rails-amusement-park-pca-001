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
      @login_text = "Login"
      @login_url = signin_path
    else
      @login_text = "Logout"
      @login_url = "/"
    end
  end
end
