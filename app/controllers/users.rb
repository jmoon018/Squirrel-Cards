get '/users/new' do
  @user = User.new
  erb :'users/new'
end

post '/users/new' do
  @user = User.new(params[:user])
  if @user.save
    session_set_current_user @user
    redirect ("/")
  else
    erb :'users/new'
  end
end

put '' do
end

delete '' do
end
