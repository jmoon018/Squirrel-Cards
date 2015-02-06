require_relative '../spec_helper.rb'

describe "deck + cards models" do

before(:each) do
  Card.destroy_all
  Deck.destroy_all
end

  # CARD PROPERTIES
  # =============================
  describe "card properties" do
    it "can create a valid card" do
      Card.new().should be_valid
    end

    it "can retain question property" do
      question = "What is the color of a red apple?"
      card = Card.new(deck_id: 1,
        question: question,
        answer: "red")

      expect(card.question).to eq(question)
    end

    it "will recognize wrong questions" do
      question = "What is the color of a red apple?"
      card = Card.new(deck_id: 1,
        question: question,
        answer: "red")
      expect(card.question).not_to eq(question + "!")
    end

    it "can retain answer property" do
      answer = "red"
      card = Card.new(deck_id: 1,
        question: "What is the color of a red shirt?",
        answer: answer)

      expect(card.answer).to eq(answer)
    end

    it "will recognize wrong answers" do
      answer = "red"
      card = Card.new(deck_id: 1,
        question: "What is the color of a red shirt?",
        answer: answer)
      expect(card.answer).not_to eq(answer.capitalize)
    end

    it "will know when the answer is correct" do
      answer = "red"
      card = Card.new(deck_id: 1,
        question: "What is the color of a red shirt?",
        answer: answer)
      expect(card.compare("red")).to eq(true)
    end
  end



  # DECK PROPERTIES
  # =============================
  describe "deck properties" do
    it "will retain deck name property" do
      name = "Jamal's Deck"
      deck = Deck.new(user_id: 1,
        name: name,
        description: "The best deck in da entire world!")

      expect(deck.name).to eq(name)
    end

    it "will recognize wrong deck names" do
      name = "Jamal's Deck"
      deck = Deck.new(user_id: 1,
        name: name,
        description: "The best deck in da entire world!")
      expect(deck.name).not_to eq(name+"!!!!")
    end


   it "will retain deck description property" do
      description = "The best deck in da entire world!"
      deck = Deck.new(user_id: 1,
        name: "Jamal's Deck",
        description: description)

      expect(deck.description).to eq(description)
    end

    it "will recognize wrong deck descriptions" do
      description = "The best deck ever!!!"
      deck = Deck.new(user_id: 1,
        name: "Jamal's Deck",
        description: description)
      expect(deck.description).not_to eq(description+"!!!!")
    end
  end

  describe "the relationship between card + deck" do
    deck = Deck.new(name: "Jamal's Deck",
      description: "A terse description of Jamal's Deck")
    it "deck is empty upon init." do
      expect(deck.cards).to be_empty
    end

    it "deck can contain multiple (2) cards" do
      card1 = Card.create(answer: "Ans1", question: "Que1", deck_id: 1)
      card2 = Card.create(answer: "Ans2", question: "Que2", deck_id: 1)
      (Card.all.count).should eq(2)
    end
  end
end
