require('rspec')
require ('pg')
require('stop')
require('pry')
require('station')
require('line')

DB = PG.connect({:dbname => 'train_system_test'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM lines *;")
    DB.exec("DELETE FROM  stops *;")
    DB.exec("DELETE FROM  stations *;")
  end
end
