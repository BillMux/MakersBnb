class Booking
  include DataMapper::Resource

  property :id, Serial
  property :start_date, Date
  property :end_date, Date
  property :user_id, Integer

  belongs_to :space
end
