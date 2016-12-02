def logged_in?
  !!current_user
end


def current_user
  @current_user ||= User.find_by(id: session[:user_id])
end

def current_user_page(user)
  if logged_in? && user.id == current_user.id
    return "You don't"
  else 
    return "#{user.username.capitalize} doesn't"
  end
end