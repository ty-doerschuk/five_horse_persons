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
