before '/rounds*' do
  unless logged_in?
    redirect '/'
  end
end

get '/rounds/new' do
  round = Round.create!(user_id: params[:user_id],
                        deck_id: params[:deck_id])
  redirect "/rounds/#{round.id}/guesses/new"
end

get '/rounds/:round_id/guesses/new' do
  @round = Round.find(params[:round_id])
  @last_guess = @round.guesses.last
  if @round.no_more_cards?
    @round.touch
    redirect "/rounds/#{@round.id}"
  else
    @card = @round.get_next_card
    erb :'guesses/new'
  end
end

post '/rounds/:round_id/guesses' do
  @round = Round.find(params[:round_id])
  @guess = @round.guesses.new(params[:guess])
  @guess.answer_checker(params[:user_answer])
  if @guess.save
    # redirect to next card that hasn't been answered correctly.
    redirect "/rounds/#{@round.id}/guesses/new"
  else
    erb :'guesses/new'
  end
end

get '/rounds/:id' do
  @round = Round.find(params[:id])
  @ric_flair = true
  erb :'rounds/show'
end

