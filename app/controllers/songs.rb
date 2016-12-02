get '/songs/new' do
  erb :'/songs/new'
end

post '/songs' do
  if song = Song.find_by(title: params[:title])
    redirect "/songs/#{song.id}"
  else
# get json string
    @song = params["title"]
    song = @song.split(" ")
    song = song.join("%20")
    @artist = params["artist"]
    artist = @artist.split(" ")
    artist = artist.join("%20")
    # getting 401 need to fix 
    response = open("http://api.musixmatch.com/ws/1.1/track.search?q_track=" + song + "&q_artist=" + artist + "&f_has_lyrics=1" + apikey).read
    parsed_response = JSON.parse(response)
    binding.pry 
    song = Song.new(title: params[:title], artist_id: artist_id(parsed_response), twitter: twitter_url(parsed_response))
    if song.save 
      redirect "/songs/#{song.id}"
    else
      # not working
      @errors = ["This song doesn't exists. Please try again!"]
      erb :'/songs/new'
    end 
  end
end 