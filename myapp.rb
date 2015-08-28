require 'sinatra'
require 'sinatra/reloader'
 
get '/' do
	@title = "入力フォーム"
    erb :index
end

get '/about' do
  erb :about
end

get '/finish' do
  erb :finish
end

post '/check' do
  @email = params[:email]
  @message = params[:message]
  erb :check
end