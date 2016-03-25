class User < ActiveRecord::Base
  has_many  :rounds
  has_many  :guesses, through: :rounds
end
