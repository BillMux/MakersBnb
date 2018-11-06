class User
  include DataMapper::Resource
  property :id, Serial
  property :name, String
  property :email, String
  property :password, String, length: 6..25
  property :created_at, DateTime

  has n, :listings

  def self.log_in(email, password)
    user = User.first(:email => email)
    return user.password == password
  end
end
