class Card < ActiveRecord::Base
  has_many    :guesses
  belongs_to  :deck
  has_many    :rounds, through: :guesses
end

