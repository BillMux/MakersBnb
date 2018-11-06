require 'data_mapper'
require 'dm-postgres-adapter'

require_relative 'user'

DataMapper.setup(:default, 'postgres://@localhost/MakersBnBDatabase')
DataMapper.finalize
DataMapper.auto_upgrade!
