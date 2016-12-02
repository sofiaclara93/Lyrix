get '/songs/new' do
  erb :'/songs/new'
end

post '/songs' do
  if song = Song.find_by(title: params[:title])
    redirect "/songs/#{song.id}"
  else
    @song = params["title"]
    song = @song.split(" ")
    song = song.join("%20")
    @artist = params["artist"]
    artist = @artist.split(" ")
    artist = artist.join("%20")
    response = open("http://api.musixmatch.com/ws/1.1/track.search?q_track=" + song + "&q_artist=" + artist + "&f_has_lyrics=1&" + apikey).read
    parsed_response = JSON.parse(response)
    song = Song.new(title: params[:title], artist: params[:artist], track_id: track_id(parsed_response), album: album_name(parsed_response), artist_id: track_artist(parsed_response))
    lyrics_response = open("http://api.musixmatch.com/ws/1.1/track.lyrics.get?track_id=" + "#{song.track_id}" + "&" + apikey).read
    parsed_lyrics_response = JSON.parse(lyrics_response)
    song.lyrics = lyrics(parsed_lyrics_response)
    if song.save
      redirect "/songs/#{song.id}"
    else
      # not working
      @errors = ["This song doesn't exists. Please try again!"]
      erb :'/songs/new'
    end
  end
end

get '/songs/:song_id' do
  @song = Song.find_by(id: params[:song_id])
  erb :'songs/show'
end
