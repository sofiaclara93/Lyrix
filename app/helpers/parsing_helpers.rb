def apikey
  apikey = "apikey=435a3ecde4f71440f8107547b1dbcb35"
end

def artist_id(response)
  response["message"]["body"]["artist_list"][0]["artist"]["artist_id"]
end

def twitter_url(response)
  response["message"]["body"]["artist_list"][0]["artist"]["artist_twitter_url"]
end