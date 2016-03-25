class Guess < ActiveRecord::Base
  belongs_to  :card
  belongs_to  :round
  has_one     :user, through: :round

  def answer_checker(user_answer)
    if self.card.answer == user_answer
      self.true_or_false = true
    else
      self.true_or_false = false
    end
  end

end
