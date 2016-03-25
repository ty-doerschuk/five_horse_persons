get '/rounds/:round_id/guesses/new' do
  @round = Round.find(params[:round_id])
  # based on name of helper method that finds current user from sessions and assigns it to an instance variable
  # @user = current_user
  erb :'guesses/new'
end

post '/rounds/:round_id/guesses' do
  puts params
  @round = Round.find(params[:round_id])
  @guess = @round.guesses.new(params[:guess])
  # check if the user's answer is true
  # SAMPLE CODE
  # if @guess.is_true?(params[:user_answer])
  # => @guess(:true_or_false) = true
  # end
  if @guess.save
    redirect "/rounds/#{@round.id}/guesses"
  else
    erb :'guesses/new'
  end
end
