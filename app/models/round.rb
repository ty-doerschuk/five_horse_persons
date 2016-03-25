class Round < ActiveRecord::Base
  belongs_to  :user
  belongs_to  :deck
  has_many    :guesses
  has_many    :cards, through: :guesses
end

