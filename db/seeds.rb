#User
# {name: string, password: string, email: string}
#Deck
# {description: string, name: string, user_id: integer}
#Card
# {question: string, answer: string, deck_id: integer}
test_user = {name: "dingus", password: "cheese", email: "higherEducation@kansas.dum"}
test_user2 = {name: "Jamal", password: "cheese", email: "stfu@gmail.com"}
deck1 = {description: "A buncha questions about the dinosaurs who are now extinct because of too much cheese on planet Earth.", name: "Dinosaurs"}
card1 = {question: "How many toes do dinosaurs have?", answer: "5"}
card2 = {question: "Dinosaurs had ___ fingers", answer: "6"}
card3 = {question: "How many babies did dinosaurs have on average?", answer: "7", image_link: "http://upload.wikimedia.org/wikipedia/commons/thumb/1/1c/Oolithes_spheroides_%28Senckenberg%29.jpg/320px-Oolithes_spheroides_%28Senckenberg%29.jpg"}
card4 = {question: "How often did dinosaurs eat cheese each day?", answer: "8"}
cards1 = [card1,card2,card3,card4]
deck2 = {name: "Science", description: "Actual facts about real things. Totally dependable"}
card12 = {question: "How many planets are there?", answer:"1"}
card22 = {question: "Did humans descend from chimpanzees", answer:"no"}
card32 = {question: "Can god travel faster than light?", answer:"Of course he can, you're going to hell"}
card42= {question: "Do people you don't like have souls?", answer:"no"}
cards2 = [card12,card22,card32,card42]

deck3 = {name: "Math", description: "Boolean algebra, functions, trig, statistics, infinite series, etc"}
card13 = {question: "What is the integral of x?", answer: "x^2/2"}
card23 = {question: "What is the derivative of e^x?", answer: "e^x"}
cards3 = [card13, card23]
User.create(test_user)
User.last.decks.create(deck1)
cards1.each do |card|
  User.last.decks.last.cards.create(card)
end
User.last.decks.create(deck2)
cards2.each do |card|
  User.last.decks.last.cards.create(card)
end
User.create(test_user2)
User.last.decks.create(deck3)
cards3.each do |card|
  User.last.decks.last.cards.create(card)
end

