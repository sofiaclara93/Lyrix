def apikey
  apikey = "apikey=435a3ecde4f71440f8107547b1dbcb35"
end

def artist_id(response)
  response["message"]["body"]["artist_list"][0]["artist"]["artist_id"]
end

def twitter_url(response)
  response["message"]["body"]["artist_list"][0]["artist"]["artist_twitter_url"]
end

def track_id(response)
  response["message"]["body"]["track_list"][0]["track"]["track_id"]
end

def album_name(response)
  response["message"]["body"]["track_list"][0]["track"]["album_name"]
end

def lyrics(response)
  response["message"]["body"]["lyrics"]["lyrics_body"]
end

def track_artist(response)
  response["message"]["body"]["track_list"][0]["track"]["artist_id"]
end

def redirect_format(song)
  song = song.title
  song = song.split(" ")
  song = song.join("-")
end


def liked_songs(user)
  likes = Like.where(liker_id: user.id, likeable_type: "Song")
end

def find_song(like)
  Song.find_by(id: like.likeable_id)
end
