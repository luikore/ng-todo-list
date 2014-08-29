require "sinatra"
require "slim"
require "coffee-script"
require "sass"

get '/app.js' do
  # content_type 'application/javascript'
  coffee :app
end

get '/app.css' do
  # content_type 'text/css'
  sass :app
end

get '*' do
  slim :app
end
