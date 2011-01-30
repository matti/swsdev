require 'rubygems'
require 'sinatra'
require 'dm-core'
require 'dm-migrations'
#require 'dm-postgres-adapter'
require 'erb'

class Ilmo
  include DataMapper::Resource    # Tuodaan datamapperin toiminnallisuus PORO:n

  property :id, Serial, :key => true
  property :amount, Integer, :default => 0
end

configure do  # suoritetaan aina ensin
  db_file = File.dirname(File.expand_path(__FILE__)) + "/db.sqlite"

  #DataMapper.setup(:default, 'sqlite://' + db_file)
  DataMapper.setup(:default, ENV['DATABASE_URL'] || 'sqlite://' + db_file)
  DataMapper.auto_upgrade!  # Luo tietokannan, taulut ja päivittää kentät
end


# Quick test
get '/' do
  @ilmo = Ilmo.first(:id => 1)

  @ilmo = Ilmo.new unless @ilmo  # jos ei löytynyt id:llä "1", niin luo uusi

  @ilmo.amount = @ilmo.amount + 1   # kasvata normaalisti kenttää
  @ilmo.save                        # persistoi

  #"<h3>Fasistic extreme apprenticeship</h3> <p> #{@ilmo.amount} hits</p> <p><a href=\"/\">press here</a></p>"
  erb :index
end

get '/env' do
  ENV.inspect
end
