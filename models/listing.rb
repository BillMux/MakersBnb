class Listing
  include DataMapper::Resource
  property :id, Serial
  property :title, String
  property :location, String
  property :description, String
  property :guests, Integer
  property :type, String

  belongs_to :user
end
