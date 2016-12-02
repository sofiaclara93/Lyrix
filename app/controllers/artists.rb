get '/artists/new' do
  erb :'/artists/new'
end

post '/artists' do
  if artist = Artist.find_by(name: params[:name])
    redirect "/artists/#{artist.id}"
  else
    @artist = params["name"]
    artist = @artist.split(" ")
    artist = artist.join("%20")
    response = open("http://api.musixmatch.com/ws/1.1/artist.search?q_artist=" + artist + "&page_size=1&" + apikey).read
    parsed_response = JSON.parse(response)
    artist = Artist.new(name: params[:name], artist_id: artist_id(parsed_response), twitter: twitter_url(parsed_response))
    if artist.save 
      redirect "/artists/#{artist.id}"
    else
      # not working
      @errors = ["This artist doesn't exists. Please try again!"]
      erb :'/artists/new'
    end 
  end
end

get '/artists/:artist_id' do
  @artist = Artist.find_by(id: params[:artist_id])
  erb :'/artists/show'
end
