require 'data_mapper'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "sqlite3://#{Dir.pwd}/development.db")

class Note
  include DataMapper::Resource
  property :id,           Serial
  property :content,      String
  property :create_at,    DateTime, :default => Time.now
  property :completed_at, DateTime
end

DataMapper.auto_upgrade!