get '/rounds/new' do
  puts "================================================="
  puts params
  round = Round.create!(user_id: params[:user_id],
                        deck_id: params[:deck_id])
  redirect "/rounds/#{round.id}/guesses/new"
end

get '/rounds/:round_id/guesses/new' do
  @round = Round.find(params[:round_id])
  if @round.no_more_cards?
    # redirect to whatever page
    puts "================================================="
    puts "You finished"
    puts "================================================="
    # change redirect to game over page instead of index
    redirect "/rounds/#{@round.id}"
  else
    @card = @round.get_next_card
    erb :'guesses/new'
  end
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

get '/rounds/:id' do
  @round = Round.find(params[:id])
  erb :'rounds/show'
end

