def logged_in?
  session[:id]
end

def current_user
  @current_user = User.find(session[:id])
end

