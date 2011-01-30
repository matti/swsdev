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

  def self.generoi_aika( aika )
    aika_pilkottuna = aika.split
    pp = aika_pilkottuna[0]
    kk = aika_pilkottuna[1]
    vv = aika_pilkottuna[2]
    tt = aika_pilkottuna[3]
    mm = aika_pilkottuna[4]
    Time.gm(vv,kk,pp,tt,mm,0)
  end
end
