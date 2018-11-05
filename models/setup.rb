require 'dm-core'
require 'dm-migrations'
require 'dm-timestamps'
require 'dm-validations'
require 'users.rb'

DataMapper.setup(:default, 'postgres://williammuxworthy@localhost/MakersBnBDatabase')

DataMapper.auto_upgrade!
