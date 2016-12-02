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