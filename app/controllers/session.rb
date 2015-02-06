get '/session/new' do
  @user = User.new
  erb :'/session/new'
end

post '/session/new' do
  @info = params[:user]
  if session_authenticate(@info[:name], @info[:password])
  else
    redirect('/session/new')
  end
  redirect("/")
end

get '/session/logout' do
  session_logout
  # redirect("/")
  erb :'/signout'
end

put '' do
end

delete '' do
end
