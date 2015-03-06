# Homepage (Root path)
enable :sessions
require "sinatra/json"

CALLBACK_URL = "http://localhost:3000"

Instagram.configure do |config|
  config.client_id = "63b582e464b24b6297fc465c07c80d18"
  config.client_secret = "8a6d6c628d0c49f7bb4a095d29ae4527"
end

get "/" do
  erb :index
end

get "/photos/index" do
  lon = params[:lon]
  lat = params[:lat]
  client = Instagram.client(:access_token => session[:access_token])
  photos_array = []
  for media_item in client.media_search(lat,lon, count: 12, distance: 80)
    photos_array << ["<img src='#{media_item.images.low_resolution.url}'>", "#{media_item.link}", "#{media_item.user.username}"]
  end
  json photos_array
end
