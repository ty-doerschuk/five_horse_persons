enable :sessions

get '/users/new' do
  erb :new_user
end

get '/users' do
  @user = User.find_by(id: params[:id])
  redirect "/users/#{current_user.id}" unless @user
  @list_of_decks = Deck.all
  @list_of_users = User.all
  erb :'users/user_page'
end

post '/users' do
  @user = User.create(username: params[:username])
  @user.password = params[:password]
  if @user.save
    session[:id] = @user.id
    redirect "/users/#{@user.id}"
  else
    @errors = @user.errors.full_messages
    erb :new_user
  end
end

post '/users/login' do
  @user = User.find_by(username: params[:username])
  if @user && @user.authenticate(params[:password])
      session[:id] = @user.id
      redirect "/users/#{@user.id}"
  else
    @errors = ["Invalid Username/Password"]
    erb :index
  end
end

get '/users/:id' do
  unless logged_in?
    redirect '/'
  else
    @user = User.find_by(id: params[:id])
    redirect "/users/#{current_user.id}" unless @user
    @list_of_decks = Deck.all
    @list_of_users = User.all
    erb :'users/user_page'
  end
end

get '/logout' do
  session.clear
  redirect '/'
end
