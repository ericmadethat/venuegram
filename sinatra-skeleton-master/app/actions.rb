# Homepage (Root path)
enable :sessions

CALLBACK_URL = "http://localhost:3000"

Instagram.configure do |config|
  config.client_id = "63b582e464b24b6297fc465c07c80d18"
  config.client_secret = "8a6d6c628d0c49f7bb4a095d29ae4527"
  # For secured endpoints only
  #config.client_ips = '<Comma separated list of IPs>'
end

get "/" do
  '<a href="/oauth/connect">Connect with Instagram</a>'
  erb :index
end

get "/photos/index" do
  client = Instagram.client(:access_token => session[:access_token])
  html = "<h1>Search things aroudn Launch Academy by lat/lng with a radius of 5000m</h1>"
  for location in client.location_search("49.28184","-123.10816","5000")
    html << "<li> #{location.name} <a href='https://www.google.com/maps/preview/@#{location.latitude},#{location.longitude},19z'>Map</a></li>"
  end
  html
end

