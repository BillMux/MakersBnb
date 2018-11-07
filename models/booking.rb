class Booking
  include DataMapper::Resource

  property :start_date, Date
  property :end_date, Date
  property :user_id, Serial

  belongs_to :space
end
