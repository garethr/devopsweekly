#!/usr/bin/env ruby

require 'rubygems'
require 'sinatra'
require 'rack/no-www'

use Rack::NoWWW

before do
  response.headers['Cache-Control'] = 'public, max-age=600'
end

get '/' do
  erb :index
end

not_found do
  erb :error
end
