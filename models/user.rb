class User
  include DataMapper::Resource
  property :id, Serial
  property :name, String
  property :email, String
  property :password, String, length: 6..25
  property :created_at, DateTime

  # has n, :listings
  DataMapper.finalize
end
