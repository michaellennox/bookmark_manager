require 'bcrypt'

class User

  include DataMapper::Resource

  property :id, Serial
  property :email, String
  property :password_hash, String

#   class << self
#     def count
#       @count ||= 0
#     end
end
