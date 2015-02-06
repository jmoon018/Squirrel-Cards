require_relative '../spec_helper.rb'

describe "decks list page for a user" do

  # after(:each) do
  #   Card.destroy_all
  #   Deck.destroy_all
  # end

  describe "deck information is shown" do
    deck_name_1 = "Jamal's Deck"
    deck_desc_1 = "This deck contains an extraordinary amount of random questions that most people will be incapacble of simply fathoming. This deck is not for the feint of heart. You may proceed, but please do so with caution."
    deck = Deck.create(user_id: 1,
      name: deck_name_1,
      description: deck_desc_1)
    Card.create(deck_id: 1,
      answer: "The answer 1",
      question: "The question 2")
    Card.create(deck_id: 1,
      answer: "The answer 2",
      question: "The question 2")

    it "shows the deck name on the page" do
      deck.reload
      get '/decks'
      expect(last_response.body).to include(deck_name_1)
    end

    it "shows the deck description on the page" do
      deck.reload
      get '/decks'
      expect(last_response.body).to include(deck_desc_1)
    end

    it "shows the deck's card count on the page" do
      deck.reload
      get '/decks'
      expect(last_response.body).to include("2")
    end
  end
end
