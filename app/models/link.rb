require 'data_mapper'
require 'dm-postgres-adapter'

class Link
  include DataMapper::Resource
  property :id, Serial
  property :url, String
  property :title, String
end

DataMapper.setup(:default, 'postgres://localhost/garethmckenna')
DataMapper.finalize
DataMapper.auto_upgrade!

#Link.create(url: 'google.com', title: 'Google')
