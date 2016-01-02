require 'bcrypt'

class User
  include DataMapper::Resource
  include BCrypt
  attr_accessor :password_confirmation

  property :id,              Serial
  property :email,           String, required: true, unique: true, format: :email_address
  property :password_digest, Text

  validates_confirmation_of :password

  def password=(password)
    self.password_digest = Password.create(password)
  end

  def password
    @password ||= Password.new(password_digest)
  end

  def self.authenticate(email, pass)
    user = first(email: email)
    user.password == pass ? user : nil
  end
end
