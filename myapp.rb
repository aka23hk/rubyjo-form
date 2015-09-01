require 'rubygems' # この辺を追記
require 'bundler'
Bundler.require
require 'sinatra'
require 'sinatra/reloader'
require 'rest_client'
 
get '/' do
	@title = "入力フォーム"
    erb :index
end

get '/about' do
	erb :about
end

post '/check' do
	@email = params[:email]
	@message = params[:message]
	erb :check
end

post '/send_mail' do
	@email = params[:email]
	@message = params[:message]
	send_simple_message(params[:email], params[:message])
	erb :finish
end

def send_simple_message(email, message)
  RestClient.post "https://api:key-cabe4d08ae4cc3fab6b5946eb54f0123"\
  "@api.mailgun.net/v3/sandboxcebbc7038ab145f1968fcd1e04eb9142.mailgun.org/messages",
  :from => "Excited User <mailgun@sandboxcebbc7038ab145f1968fcd1e04eb9142.mailgun.org>",
  :to => "akane <ne250128@senshu-u.jp>",
  :subject => "お問い合わせ内容確認",
  :text => email+"さんからお問い合わせがありました。"+"\n"+"本文："+message
end