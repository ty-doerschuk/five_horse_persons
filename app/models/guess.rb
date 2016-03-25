class Guess < ActiveRecord::Base
  belongs_to  :card
  belongs_to  :round
  has_one     :user, through: :round

  #do not know yet if I need to have an instance of class Guess to call answer_checker
  def answer_checker(user_answer)
    if self.card.answer == user_answer
      self.true_or_false = true
    else
      self.true_or_false = false
    end
  end

end
