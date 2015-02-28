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
  erb :index
end

# get "/photos/index" do
#   client = Instagram.client(:access_token => session[:access_token])
#   html = "<h1>Search things around Launch Academy by lat/lng with a radius of 5000m</h1>"
#   for location in client.location_search("49.28184","-123.10816","5000")
#     html << "<li> #{location.name} 
#     <a href='https://www.google.com/maps/preview/@#{location.latitude},#{location.longitude},19z'>Map</a></li>"
#   end

#   https://api.instagram.com/v1/media/search?lat=49.28184&lng=-123.10816&client_id=63b582e464b24b6297fc465c07c80d18



#   html
# end
#access token = 1725402384.55ca576.3e5cb113deca4c849b93971afd1ed31c


get "/photos/index" do
  long = params[:long]
  lat = params[:lat]
  client = Instagram.client(:access_token => session[:access_token])
  html = "<h1>Here are photos around Launch Academy</h1>"
  photos_array = []
  for media_item in client.media_search(lat,long, count: 30)

    # index += 1
    photos_array << "<img src='#{media_item.images.low_resolution.url}'>"
    # binding.pry if index == 0
    # html << "<pre>#{media_item.inspect}</pre>"
  end
  photos_array
end
# get "/photos/index" do
#   client = Instagram.client(:access_token => session[:access_token])
#   erb :photos/index
  # html = "<h1>Here are photos around Launch Academy</h1>"
  # index = 0
  # for media_item in client.media_search("49.28184","-123.10816", count: 30)
  #   index += 1
  #   html << "<img src='#{media_item.images.low_resolution.url}'>"
  #   binding.pry if index == 0
  #   html << "<pre>#{media_item.inspect}</pre>"
  # end
  # html
# end
