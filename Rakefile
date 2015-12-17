require 'data_mapper'
require './app/app.rb'

task :auto_upgrade do
  DataMapper.auto_upgrade!
  puts "auto-upgrade complete (no data loss)"
end

task :auto_migrate do
  DataMapper.auto_migrate!
  puts "auto-upgrade complete (data was lost)"
end
