require "sinatra"
require "slim"
require "coffee-script"
require "sass"
require "sinatra/reloader"

get '/app.js' do
  coffee :app
end

get '/app.css' do
  sass :app
end

get '*' do
  slim :app
end
