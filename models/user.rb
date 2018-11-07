class User
  include DataMapper::Resource
  property :id, Serial
  property :name, String
  property :email, String, required: true, unique: true
  property :password, String, length: 6..25
  property :created_at, DateTime

  has n, :spaces

  def self.log_in(email, password)
    user = User.first(email: email)
    user.password == password
  end
end
