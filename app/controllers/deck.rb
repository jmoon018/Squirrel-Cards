get '/deck/:id/play' do |id|
  if Deck.where(id: id).length != 0
    @session_deck = Deck.find(id)
  else
    redirect ("/decks")
  end

  if @session_deck.muck.nil?
    @session_deck.start_game
  end
  # binding.pry
  if @session_deck.new_card?
    @session_deck.draw_card!
  end
  erb :"deck/play"


end

post '/deck/:id/play' do

end

=begin
get '/session/logout' do
  session_logout
  redirect("/")
end

put '' do
end

delete '' do
end
=end
