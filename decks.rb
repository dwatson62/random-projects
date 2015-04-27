# This program creates a deck of cards, stores it as an array
# It then shuffles the deck and shows you the first five cards

$deck = []

def createdeck(suit)
		for x in 2..10
				number = x.to_s
				$deck.push(suit + number)
		end
		faces = ["J","Q","K","A"]
		faces.each {|x| $deck.push(suit + x)}
end

suitarray = ["D", "H", "C", "S"]
suitarray.each { |suit| createdeck(suit)}

$deck.shuffle!
puts "These are your cards #{$deck[0]}, #{$deck[1]}, #{$deck[2]}, #{$deck[3]}, #{$deck[4]}"
