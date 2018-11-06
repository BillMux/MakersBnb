require 'dm-migrations'
require 'dm-postgres-adapter'

if ENV['ENV'] == 'test'
  DataMapper.setup(:default, 'postgres://@localhost/MakersBnBDatabase_test')
else
  DataMapper.setup(:default, 'postgres://@localhost/MakersBnBDatabase')
end

require_relative 'user'
require_relative 'space'

DataMapper.finalize
DataMapper.auto_upgrade!
