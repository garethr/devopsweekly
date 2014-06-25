require 'rubygems'
require 'sinatra'
require 'rack/no-www'

use Rack::NoWWW

set :public_folder, Proc.new { File.join(root, "_site") }

# This before filter ensures that your pages are only ever served 
# once (per deploy) by Sinatra, and then by Varnish after that
before do
  response.headers['Cache-Control'] = 'public, max-age=31557600' # 1 year
end

get '/' do
  erb :index
end

get '/:year/:month/:day/:title/' do
     File.read("_site/#{params[:year]}/#{params[:month]}/#{params[:day]}/#{params[:title]}/index.html")
end

get '/archive' do
     File.read("_site/archive/index.html")
end


not_found do
  erb :error
end
