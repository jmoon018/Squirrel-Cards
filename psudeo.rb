__END__

Flash cards
C-A user can choose which deck to use
C-A user can create their own deck
V-A user can see a single flashcard
MV-A user sees a single, hard-coded deck
V-A user sees a styled site
V-A user sees a responsively styled site
M-A user can see all their past scores
C-A user can play a "round," which is a series of guesses over all the cards in a deck
C-A user can make a guess on a single flashcard
V-A user is told if they make an incorrect guess
C-A user can skip a flashcard
C-A user can log in
C-A user skips a flashcard if they guess incorrectly too many times
C-A user receives a score at the end of the game
M-A user can see a high score table
C-A user can guess on skipped flashcards after running through the deck once

_____
using the sinatra MVC framework
salient objects
Users exist
decks exist
cards exist
game_sessions (user has many, stores cards tried and cards correctly)

possessions of objects
Users###
have names
have passwords/password_hashes
have decks(which have cards)
have game_sessions

decks###
have names
have a maker (could have many players?)
have cards
have a description
mk2 feature public/private decks

cards###
has a question
has an answer (mk2 feature, an associated picture)
mk2 answer parsing for near misses
belong_to a deck
mk2 copy a card to another deck

game_sessions###
knows what deck was used
knows how many cards have guessed
knows which cards have been skipped
knows how many cards have been answered correctly

wireframing soon
\
  \deck_list
    \choosen_deck reroutes to game_session
  \game_session
    \answer_card
    \
  \card_creation
    \deck_assignment

