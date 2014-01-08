require File.dirname(__FILE__)+'/../main.rb'
require 'rack/test'

set :environment, :test

def app
  Sinatra::Application
end

describe 'Note System' do
  include Rack::Test::Methods
  it 'should can access home page' do
    get '/'
    last_response.should be_ok
  end

end