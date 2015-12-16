# Discuss with your pair partner what a "model" is and how it relates to a class or table/relation
# Create a model (DataMapper backed ruby class) in app/models/link.rb with :id, :title and :url properties
# At the bottom of link.rb, instruct DataMapper to:
# setup a connection to the bookmark_manager_test database
# finalize your DataMapper model
# update your DataMapper models
# Ensure that you have a new error related to visiting the links page
require 'data_mapper'
require 'dm-postgres-adapter'

# ENV["RACK_ENV"] ||= "development"

class Link

  include DataMapper::Resource

  property :id,    Serial
  property :title, String
  property :url,   String

end

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/bookmark_manager_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_upgrade!
