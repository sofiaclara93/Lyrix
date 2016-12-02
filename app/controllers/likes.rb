post '/songs/:song_id/likes' do
  if logged_in?
    like = Like.new(liker_id: current_user.id, likeable_id: params[:song_id], likeable_type: params[:type], like_direction: params[:like].to_i)
    song = Song.find_by(id: params[:song_id])
    if like.save && request.xhr?
      likes = song.favorites
      content_type :json
      {likes: likes.to_s}.to_json
    else
      status 422
    end
  else
    status 401
  end
end

post '/users/:user_id/likes' do
  if logged_in?
    like = Like.new(liker_id: current_user.id, likeable_id: params[:user_id], likeable_type: params[:type], like_direction: params[:like].to_i)
    user = User.find_by(id: params[:user_id])
    if like.save && request.xhr?
      likes = user.favorites
      content_type :json
      {likes: likes.to_s}.to_json
    else
      status 422
    end
  else
    status 401
  end
end
