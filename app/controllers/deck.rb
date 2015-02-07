get '/decks' do
  @user_id = session[:current_user_id]
  @user_decks = User.find(@user_id).decks

  puts "IN decks"
  puts @user_decks
  puts @user_id

  erb :decks
end

get '/decks/:deck_name/edit' do
  user_id = session[:current_user_id]
  user = User.find(user_id)

  @deck = user.decks.where(name: params[:deck_name])

  if @deck.count == 0 # empty
    puts "you suck, pick a right deck"
  else
    @deck = @deck.first

    erb :view_decks
  end
end

post '/decks/:deck_name/edit' do

  user = User.find(session[:current_user_id])
  @deck = user.decks(name: params[:deck_name]).first
  @deck.cards.create()

  redirect "/decks/#{@deck.name}/edit"
end

put '/decks/:deck_name/edit' do
  user = User.find(session[:current_user_id])
  @deck = user.decks.where(name: params[:deck_name]).first

  # update each card because i dont know how to do them individually.. yet
  @deck.cards.each do |card|
    card_id = card.id.to_s
    card.update(question: params["#{card_id}_question".to_sym].to_s,
     answer: params["#{card_id}_answer".to_sym].to_s)
  end
  params[:new_card] = false
  erb :view_decks
end

get '/decks/:deck_name/new' do
  user = User.find(session[:current_user_id])
  @deck = user.decks.where(name: params[:deck_name]).first
  erb :new_card
end
