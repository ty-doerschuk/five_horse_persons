enable :sessions

get '/users/new' do
  erb :new_user
end

post '/users/new' do
  @user = User.create(username: params[:username])
  @user.password = params[:password]
  if @user.save
    redirect '/'
  else
    @errors = @user.errors.full_messages
    erb :new_user
  end
end

post '/users/login' do
  @user = User.find_by(username: params[:username])

  if @user.authenticate(params[:password])
      session[:id] = @user.id
      redirect "/users/#{@user.id}"
  else
    @errors = ["Invalid Username/Password"]
    erb :index
  end
end
