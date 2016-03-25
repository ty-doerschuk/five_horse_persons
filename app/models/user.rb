require 'bcrypt'

class User < ActiveRecord::Base
  has_many  :rounds
  has_many  :guesses, through: :rounds

  validates :username, uniqueness: true

  include BCrypt

  def password
    @password ||= Password.new(hashed_password)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.hashed_password = @password
  end

  def authenticate(entered_password)
    self.password == entered_password
  end

end
