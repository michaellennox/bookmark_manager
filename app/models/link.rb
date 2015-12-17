require 'data_mapper'
require 'dm-postgres-adapter'

class Link
  include DataMapper::Resource

  has n, :tags, through: Resource

  property :id, Serial
  property :url, String
  property :title, String

end

class Tag
  include DataMapper::Resource
  has n, :links, through: Resource
  property :id, Serial
  property :tags, String
end


DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/bookmark_manager_#{ENV['RACK_ENV']}")

DataMapper.finalize

#Link.create(url: 'google.com', title: 'Google')
