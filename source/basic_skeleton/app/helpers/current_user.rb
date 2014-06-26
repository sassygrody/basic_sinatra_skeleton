helpers do
  
  def current_user
    @user ||= User.find(session[:user_id]) if session[:user_id]
  end

 # def current_user
 #    return nil if session[:user_id].nil?
 #    @user ||= User.find(session[:user_id])
 # end
 
end

