module SessionsHelper

  # this is the cookie method
  def sign_in(user)
    cookies.permanent[:remember_token] = user.remember_token
    self.current_user = user
  end

  def sign_out
    self.current_user = nil
    cookies.delete(:remember_token)
  end


  # verifies whether a user is signed in
  def signed_in?
    !current_user.nil?
  end

  # these two methods assign the token to the user and remembers it
  def current_user=(user)
    @current_user = user
  end

  def current_user
    @current_user ||= User.find_by_remember_token(cookies[:remember_token])
  end
end
