require 'rubygems'
require 'sinatra'
require 'dm-core'
require 'dm-migrations'
#require 'dm-postgres-adapter'
require 'erb'
require './tilaisuudet.rb'

class Numero
  include DataMapper::Resource    # Tuodaan datamapperin toiminnallisuus PORO:n

  property :id, 			Serial, :key => true
  property :amount, 		Integer, :default => 0
end

configure do  # suoritetaan aina ensin
  db_file = File.dirname(File.expand_path(__FILE__)) + "/db.sqlite"

  DataMapper.setup(:default, ENV['DATABASE_URL'] || 'sqlite://' + db_file)
  DataMapper.auto_upgrade!  # Luo tietokannan, taulut ja päivittää kentät
end

get '/' do
  @nro = Numero.first(:id => 1)

  @nro = Numero.new unless @nro  # jos ei löytynyt id:llä "1", niin luo uusi

  @nro.amount = @nro.amount + 1   # kasvata normaalisti kenttää
  @nro.save                       # persistoi

  erb :index
end

get '/add' do
	t = Tilaisuus.new
	t.otsikko = "aaa"
 	t.kaupunki = "Helsinki"
	t.save

  "#{t.otsikko} added"
end

get '/env' do
  ENV.inspect
end
