require 'bcrypt'

class User < ActiveRecord::Base
  has_many  :rounds
  has_many  :guesses, through: :rounds

  validates :username, uniqueness: true, length: { minimum: 3 }
  validate :check_password

  include BCrypt

  def password
    @password ||= Password.new(hashed_password)
  end

  def password=(new_password)
    @plain_text_password = new_password
    @password = Password.create(new_password)
    self.hashed_password = @password
  end

  def authenticate(entered_password)
    self.password == entered_password
  end

  def check_password
    p @plain_text_password

    if @plain_text_password.nil? || @plain_text_password.length < 6
      errors.add(:password, "must be 6 characters or greater")
    end
  end
  # def check_password
  #   if @plain_text_password.nil?
  #     errors.add(:password, "must be created (minimum 6 characters).")
  #   end
  #   if @plain_text_password.length < 6
  #     errors.add(:password, "is too short (must be a minimum of 6 characters).")
  #   end
  # end

end
