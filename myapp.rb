require 'sinatra'
require 'sinatra/reloader'
 
get '/' do
	@title = "入力フォーム"
    erb :index
end