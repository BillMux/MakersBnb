class Space
  include DataMapper::Resource
  property :id, Serial
  property :title, String
  property :location, String
  property :description, String
  property :guests, Integer
  property :type, String

  has n, :bookings
  belongs_to :user
end
