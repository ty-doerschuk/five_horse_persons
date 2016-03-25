require 'faker'

deck = Deck.create!(name: "Signature Moves")

card1 = Card.create!(question:"What is Bret Hart's signature move?",
                      answer: "Sharpshooter",
                      deck_id: deck.id)

card2 = Card.create!(question:"What is Ric Flair's signature move?",
                      answer: "Figure Four",
                      deck_id: deck.id)

card3 = Card.create!(question:"What is Shawn Michael's signature move?",
                      answer: "Sweet Chin Music",
                      deck_id: deck.id)

user = User.create!(username: "jabroni", hashed_password: "smackdown")

round = Round.create!(user_id: user.id, deck_id: deck.id, score: nil)

guess = Guess.create!(round_id: round.id, card_id: card1.id, true_or_false: false)
