get '/' do
  if session_logged_in?
    redirect("/options")
  end
  erb :index
end


get '/options' do
  erb :option
end


get '/decks' do
  @user_id = session[:current_user_id]
  @user_decks = User.find(@user_id).decks

  puts "IN decks"
  puts @user_decks
  puts @user_id

  erb :decks
end

get '/game' do

  erb :game
end

get '/game/demo/correct' do

  erb :game_demo_correct
end

get '/game/demo/wrong' do
  erb :game_demo_wrong
end
