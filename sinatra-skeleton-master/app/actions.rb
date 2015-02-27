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

# get "/photos/index" do
#   client = Instagram.client(:access_token => session[:access_token])
#   html = "<h1>Search things around Launch Academy by lat/lng with a radius of 5000m</h1>"
#   for location in client.location_search("49.28184","-123.10816","5000")
#     html << "<li> #{location.name} 
#     <a href='https://www.google.com/maps/preview/@#{location.latitude},#{location.longitude},19z'>Map</a></li>"
#   end

#   https://api.instagram.com/v1/media/search?lat=49.28184&lng=-123.10816&client_id=63b582e464b24b6297fc465c07c80d18

#   # user = client.user
#   # html = "<h1>#{user.username}'s recent media</h1>"
#   # for media_item in client.user_recent_media
#   #   html << "<div style='float:left;'><img src='#{media_item.images.thumbnail.url}'><br/> <a href='/media_like/#{media_item.id}'>Like</a>  <a href='/media_unlike/#{media_item.id}'>Un-Like</a>  <br/>LikesCount=#{media_item.likes[:count]}</div>"
#   # end

#   html
# end
#access token = 1725402384.55ca576.3e5cb113deca4c849b93971afd1ed31c

get "/photos/index" do
  client = Instagram.client(:access_token => session[:access_token])
  html = "<h1>Get a list of media close to a given latitude and longitude</h1>"
  for media_item in client.media_search("49.28184","-123.10816")
    html << "<img src='#{media_item.images.thumbnail.url}'>"
  end
  html
end
