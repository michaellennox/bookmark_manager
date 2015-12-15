require 'data_mapper'
require 'dm-postgres-adapter'

class Link
  include DataMapper::Resource
  property :id, Serial
  property :url, String
  property :title, String
end

DataMapper.setup(:default, ENV['https://boiling-cove-6084.herokuapp.com/'] || "postgres://localhost/bookmark_manager_#{ENV['RACK_ENV']}")

DataMapper.finalize
DataMapper.auto_upgrade!

#Link.create(url: 'google.com', title: 'Google')
