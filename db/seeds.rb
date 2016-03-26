require 'faker'

# Deck.destroy_all
# Card.destroy_all
# User.destroy_all
# Round.destroy_all
# Guess.destroy_all

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

round = Round.create!(user_id: user.id, deck_id: deck.id)

guess = Guess.create!(round_id: round.id, card_id: card1.id, true_or_false: false)

#########################################################

deck2 = Deck.create!(name: "Famous Phrases")

card1 = Card.create!(question: "It doesn't matter what you think!",           answer: "The Rock",
                     deck_id: deck.id)

card2 = Card.create(question: "Rest in peace!",
                    answer: "Undertaker",
                    deck_id: deck.id)

card3 = Card.create(question: "The best there is, there best there was, the best there ever will be!",
                    answer: "Bret Hart",
                    deck_id: deck.id)