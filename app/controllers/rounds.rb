get '/rounds/:round_id/guesses/new' do
  @round = Round.find(params[:round_id])
  # based on name of helper method that finds current user from sessions and assigns it to an instance variable
  # @user = current_user
  erb :'guesses/new'
end

post '/rounds/:round_id/guesses' do
  # p params
  @round = Round.find(params[:round_id])
  @guess = @round.guesses.new(params[:guess])
  @guess.answer_checker(params[:user_answer])
  # puts @guess.true_or_false
  if @guess.save
    redirect "/rounds/#{@round.id}/guesses"
  else
    erb :'guesses/new'
  end

get '/rounds/:id' do
  @round = Round.find(params[:id])
  erb :'rounds/show'
end

end
