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

  it 'stores params' do
    get '/set', :somekey => "Test" do
      expect(last_response.body).to include("Test")
    end
  end

  it 'can retrieve the value stored at somekey' do
    get '/set', :somekey => "Test" do
      get '/get', :key => "somekey"
      expect(last_response.body).to include("Test")
    end
  end
end
