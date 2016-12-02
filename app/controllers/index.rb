get '/' do
  redirect '/search'
end
get '/search' do
  erb :'/search/new'
end
