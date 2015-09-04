require './myapp'
run Sinatra::Application
require 'rubygems'
require 'bundler'
Bundler.require
require './myapp.rb'
run Sinatra::Application
