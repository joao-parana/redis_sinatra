require "rubygems"
require "sinatra"
require "redis"
require "uri"

class App < Sinatra::Application

  configure do
    REDISTOGO_URL = "redis://localhost:6379/"
    uri = URI.parse(REDISTOGO_URL)
    REDIS = Redis.new(:host => uri.host, :port => uri.port, :password => uri.password)
  end

  set :bind, '0.0.0.0'

  get '/' do
    '<h1>Teste de Aplicacao Sinatra</h1>
     <form action="/shorten" method="POST">
       <input type="text" name="long">
       <input type="submit">
     </form>'
  end

  post '/shorten' do
    a = rand(9999)
    REDIS.set(a.to_s, "http://"+params[:long])
    "<pre>http://dockerhost:4567/get/#{a}</pre>" +
    "<a href='http://dockerhost:4567/get/#{a}'>click aqui</a>"
  end 

  get '/get/:url' do
    redirect REDIS.get(params[:url])
  end 

end
