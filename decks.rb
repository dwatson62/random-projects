# This program creates a deck of cards, stores it as an array
# It then shuffles the deck and shows you the first five cards 


deck = []

suit = ""
number = 0
card = ""

4.times do |x|
	if x == 0
		suit = "D"
		14.times do |x|
			if x == 1
				number = "A"
			elsif x == 11
				number = "J"
			elsif x == 12
				number = "Q"
			elsif x == 13
				number = "K"
			else 	
				number = x.to_s
			end
			if x != 0
				card = suit + number
				deck.push(card)
			end
		end
	elsif x == 1
		suit = "H"
		14.times do |x|
			if x == 1
				number = "A"
			elsif x == 11
				number = "J"
			elsif x == 12
				number = "Q"
			elsif x == 13
				number = "K"
			else 	
				number = x.to_s
			end
			if x != 0
				card = suit + number
				deck.push(card)
			end
		end
	elsif x == 2
		suit = "C"
		14.times do |x|
			if x == 1
				number = "A"
			elsif x == 11
				number = "J"
			elsif x == 12
				number = "Q"
			elsif x == 13
				number = "K"
			else 	
				number = x.to_s
			end
			if x != 0
				card = suit + number
				deck.push(card)
			end
		end
	elsif x == 3
		suit = "S"
		14.times do |x|
			if x == 1
				number = "A"
			elsif x == 11
				number = "J"
			elsif x == 12
				number = "Q"
			elsif x == 13
				number = "K"
			else 	
				number = x.to_s
			end
			if x != 0
				card = suit + number
				deck.push(card)
			end
		end
	end
end

deck.shuffle!
puts "These are your cards #{deck[0]}, #{deck[1]}, #{deck[2]}, #{deck[3]}, #{deck[4]}"
