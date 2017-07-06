require 'sinatra'

enable :sessions
set :port, 4000

get '/' do
  'Test'
end

get '/set' do
  session[:somekey] = params[:somekey]
end
