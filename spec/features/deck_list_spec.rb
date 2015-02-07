require_relative '../spec_helper.rb'
require_relative '../../app/helpers/session_helper.rb'

describe "decks list page for a user", focus: true do

  # after(:each) do
    # Card.destroy_all
    # Deck.destroy_all
  # end

  describe "deck information is shown" do
    before(:each) do
      Card.destroy_all
      User.destroy_all
      Deck.destroy_all
    end

    let(:jamal) {
      User.create!(name: "Jamal",
       email: "jamalemail@email.com",
      password: "jamalspassword")
    }
    let(:deck_name_1) {"Jamal's Deck"}
    let(:deck_desc_1) {"This deck contains an extraordinary amount of random questions that most people will be incapacble of simply fathoming. This deck is not for the feint of heart. You may proceed, but please do so with caution."}

    let!(:deck) {
      deck = jamal.decks.create!(
        name: deck_name_1,
        description: deck_desc_1)
      deck.cards.create!(
        answer: "The answer 1",
        question: "The question 2")
      deck.cards.create!(
        answer: "The answer 2",
        question: "The question 2")
      deck
    }

    it "shows the deck name on the page" do
      get '/decks', {}, {"rack.session" => {:current_user_id => jamal.id }}
      expect(last_response.body).to include(deck_name_1)
    end

    it "shows the deck description on the page" do
      get '/decks', {}, {"rack.session" => {:current_user_id => jamal.id }}
      expect(last_response.body).to include(deck_desc_1)
    end

    it "shows the deck's card count on the page" do
      get '/decks', {}, {"rack.session" => {:current_user_id => jamal.id }}
      expect(last_response.body).to include("2")
    end
  end


  describe "deck game model functions" do
    Card.destroy_all
    Deck.destroy_all
    system "rake db:seed RACK_ENV=test"

    deck = Deck.first
    it "loads proper deck" do
      expect(deck.description.include?("dinosaur")).to eq(true)
    end

    deck.start_game
    it "does not want to move to next card initially" do
      expect(deck.next_card?).to_not eq(true)
    end
    it "wants to move to next card if answered correctly" do
      deck.muck[-1].compare(deck.muck[-1].answer)
      expect(deck.next_card?).to eq(true)
    end

    it "wants to move to next card if card has been skipped" do
      deck.draw_card!
      deck.skip!
      expect(deck.next_card?).to eq(true)
    end

  end


end
