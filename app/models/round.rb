class Round < ActiveRecord::Base
  belongs_to  :user
  belongs_to  :deck
  has_many    :guesses
  has_many    :cards, through: :deck

  #returns array of cards that are still able to be played (never answered correctly)
  def cards_to_play
    # remove_card = self.guesses.find_by(true_or_false: true)
    correct_answers = self.guesses.where(true_or_false: true)
    @correctly_answered_cards = correct_answers.map{ |guess| guess.card }
    all_cards = self.cards
    all_cards - @correctly_answered_cards
  end

  # return true if no more cards to play
  def no_more_cards?
    self.cards_to_play.empty?
  end

  def get_next_card
    cards_to_play.sample
  end

  def correct_on_first
   all_cards_played = self.guesses.map{ |guess| guess.card }
   frequency_hash = Hash.new(0)
   all_cards_played.each{ |card| frequency_hash[card] += 1 }
   frequency_hash.reject{ |card, count| count > 1 }.keys.count
  end

  def calc_points_for_round
    initial_points = (self.guesses.where(true_or_false: true)).count * 2
    guess_penalty = (self.guesses.where(true_or_false: false)).count
    total_round_score = initial_points - guess_penalty
  end

  def calculate_time
    time_sec = (self.updated_at - self.created_at).round(1)
    if time_sec > 60
      time_min = (time_sec / 60).round
      time_sec = (time_sec - (time_min * 60)).round
    else
      time_min = 0
    end
    return "#{time_min} minutes and #{time_sec} seconds!"
  end

end

