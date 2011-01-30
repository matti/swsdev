require 'rubygems'
require 'dm-core'
require 'dm-migrations'

class Tilaisuus
  	include DataMapper::Resource

  	property :id,                 Serial, :key => true
  	property :otsikko,            String
  	property :kuvaus,             String
  	property :aika,               DateTime
  	property :kaupunki,           String
  	property :paikka,             String

	def to_s
		"#{otsikko}  #{paikka} "
	end
end
