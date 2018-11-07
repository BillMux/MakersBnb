class Space
  include DataMapper::Resource
  property :id, Serial
  property :title, String
  property :location, String
  property :description, String
  property :guests, Integer
  property :type, String

  has 1, :booking
  belongs_to :user
end
