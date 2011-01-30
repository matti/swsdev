require 'rubygems'
require 'sinatra'
require 'dm-core'
require 'dm-migrations'
#require 'dm-postgres-adapter'
require 'erb'

class Numero
  include DataMapper::Resource    # Tuodaan datamapperin toiminnallisuus PORO:n

  property :id, Serial, :key => true
  property :amount, Integer, :default => 0
end

configure do  # suoritetaan aina ensin
  db_file = File.dirname(File.expand_path(__FILE__)) + "/db.sqlite"

  DataMapper.setup(:default, ENV['DATABASE_URL'] || 'sqlite://' + db_file)
  DataMapper.auto_upgrade!  # Luo tietokannan, taulut ja päivittää kentät
end


# Quick test
get '/' do
  @Numero = Numero.first(:id => 1)

  @Numero = Numero.new unless @Numero  # jos ei löytynyt id:llä "1", niin luo uusi

  @Numero.amount = @Numero.amount + 1   # kasvata normaalisti kenttää
  @Numero.save                          # persistoi

  erb :index
end

get '/env' do
  ENV.inspect
end
