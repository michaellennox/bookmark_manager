require 'data_mapper'
require 'dm-postgres-adapter'
require 'bcrypt'

class User

  attr_reader :password
  attr_accessor :password_confirmation

  include DataMapper::Resource
  property :id, Serial
  property :email, String
  property :password_digest, Text

  validates_confirmation_of :password
  validates_format_of :email, :as => :email_address
  validates_length_of :email, :min => 1

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end
end

DataMapper.finalize
