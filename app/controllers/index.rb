get '/' do
  redirect '/search'
  # to find lyrics
  # url = "http://api.musixmatch.com/ws/1.1/track.lyrics.get?track_id="
  # response = open(url + "15953433&apikey=435a3ecde4f71440f8107547b1dbcb35").read
  # parsed_response = JSON.parse(response)
  # song = parsed_response["message"]["body"]["lyrics"]["lyrics_body"]
  # puts song

# link to get full lyrics
  # redirect "http://lyrics.musixmatch.com/Gotye-lyrics_124402/"

  # link to full song lyrics
  # link to artist page - find artist id using artist.search link above for artist page
end
