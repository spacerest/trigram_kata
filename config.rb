require 'sinatra'
require_relative 'lib/trigram'
require 'rubygems'

get '/' do
  erb :index
end
