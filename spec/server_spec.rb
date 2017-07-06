ENV['RACK_ENV'] = 'test'

require 'server'
require 'rack/test'

describe 'Server' do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  it 'sets a route' do
    get '/'
    expect(last_response.status).to eq(200)
  end
end
