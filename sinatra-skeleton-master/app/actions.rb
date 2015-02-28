# Homepage (Root path)
get '/' do
  erb :index
end

get '/map' do 
  erb :map 
end

get '/autocomplete' do 
  erb :autocomplete 
end