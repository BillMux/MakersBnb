require 'data_mapper'
require 'dm-postgres-adapter'

require_relative 'user'

if ENV['ENV'] == 'test'
  DataMapper.setup(:default, 'postgres://@localhost/MakersBnBDatabase_test')
else
  DataMapper.setup(:default, 'postgres://@localhost/MakersBnBDatabase')
end
DataMapper.finalize
DataMapper.auto_upgrade!
