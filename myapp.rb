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
	send_simple_message
	erb :finish
end



def greeting
	"Hello Ruby"
end


def send_simple_message
  RestClient.post "https://api:key-cabe4d08ae4cc3fab6b5946eb54f0123"\
  "@api.mailgun.net/v3/sandboxcebbc7038ab145f1968fcd1e04eb9142.mailgun.org/messages",
  :from => "Excited User <mailgun@sandboxcebbc7038ab145f1968fcd1e04eb9142.mailgun.org>",
  :to => "akane <ne250128@senshu-u.jp>",
  :subject => "Hello akane",
  :text => "Congratulations akane, you just sent an email with Mailgun!  You are truly awesome!  You can see a record of this email in your logs: https://mailgun.com/cp/log .  You can send up to 300 emails/day from this sandbox server.  Next, you should add your own domain so you can send 10,000 emails/month for free."
end