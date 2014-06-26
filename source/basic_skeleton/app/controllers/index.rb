
get '/' do
  # render home page
  erb :index
end

post '/' do
  "home page"
end

#----------- USERS -----------

get '/users/new' do
  # render sign-up page
  @user = User.new
  erb :sign_up
end

post '/sign_up' do
  @user = User.create(username: params[:username], email: params[:email], password: params[:password], password_confirmation: params[:password])
  session[:user_id] = @user.id
  
  redirect "/"
end

post '/login' do
@user = User.find_by_email(params[:email])
 if @user && @user.authenticate(params[:password])
    session[:user_id] = @user.id
  end
  redirect '/'
end

get '/logout' do
  session.clear
  redirect to('/')
end