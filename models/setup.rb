require 'data_mapper'
require 'dm-postgres-adapter'

require_relative 'users'

DataMapper.setup(:default, 'postgres://williammuxworthy@localhost/MakersBnBDatabase')
DataMapper.finalize
DataMapper.auto_upgrade!
