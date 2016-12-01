get '/artists/new' do
  erb :'/artists/new'
end

get '/artists' do
  @artist = params["name"]
  artist = @artist.split(" ")
  artist = artist.join("%20")
  response = open("http://api.musixmatch.com/ws/1.1/artist.search?q_artist=" + artist + "&page_size=1&" + apikey).read
  parsed_response = JSON.parse(response)
  p artist_id(parsed_response)
  # redirect "/artists/#{artist_id(parsed_response)}"
end

get '/artists/:artist_id' do
  @artist = params[:artist_id]
  erb :'/artists/show'
end
