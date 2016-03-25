get '/rounds/:round_id/guesses/new' do
  @round = Round.find(params[:round_id])
  @card = @round.get_next_card
  puts @card.question
  puts @card.answer
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
    # redirect to next card that hasn't been answered correctly.
    redirect "/rounds/#{@round.id}/guesses/new"
  else
    erb :'guesses/new'
  end
end
