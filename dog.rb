class Dog
	
	def initialize 
		@food = 4
		@toilet = 1
		@tired = 1
		@happy = 5
		@age = 0

		puts "Enter a name for your new puppy."
		$name = gets.chomp
		puts "#{$name} was born!"
		puts "
		"

	end

	def feed

		puts "#What will you feed #{$name}?"
		puts "
		"
		puts "(t)reat, (c)arrot, (p)edigree chum"
		@input = gets.chomp

		if @input == "t"
			puts "You fed #{$name} a treat."
			@food = @food + 1
			@toilet = @toilet + 1
			@tired = @tired + 1
			@happy = @happy + 1
		elsif @input == "c"
			puts "You fed #{$name} a carrot."
			@food = @food + 1
			@toilet = @toilet + 2
			@tired = @tired + 1
			@happy = @happy + 1
		elsif @input == "p"
			puts "You fed #{$name} pedigree chum."
			@food = @food + 4
			@toilet = @toilet + 4
			@tired = @tired + 2
			@happy = @happy + 2
		end
	end

	def relieve
		if @toilet > 6
			puts "#{$name} went to the toilet."
			puts "#{$name} feels much better!"
			@toilet = 0
		elsif @toilet <= 6
			puts "#{$name} does not need the toilet."
		end		
	end

	def sleep
		if @food < 4
			puts "#{$name} is moaning to be fed!"
			@happy = @happy - 1
		elsif @tired > 6
			puts "You put #{$name} to bed."
			@tired = 0
			@happy = @happy + 2
			@food = @food - 3
			@age = @age + 1
		else
			puts "#{$name} is not tired yet."
			@happy = @happy - 1
		end
	end

	def walk
		if @food < 3
			puts "#{$name} is moaning to be fed first!"
			@happy = @happy - 1
		elsif @tired < 8
			puts "You took #{$name} for a walk!"
			@happy = @happy + 4
			@tired = @tired + 2
			@food = @food - 2
			if @toilet > 6
				puts "#{$name} also went to the toilet."
				@toilet = 0
			end
		else
			puts "#{$name} is too tired."
			@happy = @happy - 1
		end
	end

	def check
		puts "#{$name}"
		puts ""
		puts ""
		puts "#{@food} Hunger"
		puts "#{@toilet} Toilet"
		puts "#{@tired} Sleep" 
		puts "#{@happy} Mood"
		puts "#{@age} Age"

		$justChecking = true
	end

	def wait
		@toilet = @toilet + 1
		@tired = @tired + 1
		@food = @food - 1
		@happy = @happy - 1
	end

	def mood
		if @food <= 2
			puts "#{$name} is starving!"
			@happy = @happy - 1
		elsif @food  > 2 && @food <= 5
			puts "#{$name} is still hungry."
			@happy = @happy - 1
		elsif @food > 5 && @food <= 7
			puts "#{$name} is satisfied."
		elsif @food > 7 && @food < 10 
			puts "#{$name} is quite full now!"
			@happy = @happy + 1
		elsif @food == 10
			puts "#{$name} was sick! You fed her too much!"
			@food = @food - 4
			@happy = @happy - 1
		end

		puts "
		"

		if @happy == 0
			puts "#{$name} bit you! She has had to be taken away to the pound!"
			puts "Game over"
			exit
		elsif @happy == 1
			puts "#{$name} is pissed off!"
		elsif @happy > 1 && @happy <= 3
			puts "#{$name} does not look happy..."
		elsif @happy > 3 && @happy <= 6
			puts "#{$name} looks okay..."
		elsif @happy > 6 && @happy <= 8
			puts "#{$name} smiles at you."
		elsif @happy > 8
			puts "#{$name} licks your face!"
		end

	end

	def death
		if @food <= 0
			puts "#{$name} dies of starvation!"
			exit
		elsif @food < 2
			puts "#{$name} looks really hungry!"
		elsif @age == 10
			puts "#{$name} dies of old age!"
			exit
		end
	end

	def needToilet
		if @toilet >= 10
			puts "#{$name} couldn't hold it in any longer, and peed on the floor!"
			@toilet = 0
			@happy = 1
		elsif @toilet > 6
			puts "#{$name} is whimpering."
		end
	end

	def needSleep
		if @tired > 7 && @tired <10
			puts "#{$name} is looking tired..."
		elsif @tired >= 10
			puts "#{$name} couldn't stay awake any longer, and fell asleep!"
			@tired = 0
			@happy = 1
			@food = @food - 4
		end
	end

	def limits
		if @happy < 0
			@happy = 0
		elsif @happy > 10
			@happy = 10
		end
		if @tired > 10
			@tired = 10
		elsif @tired < 0
			@tired = 0
		end
		if @food < 0
			@food = 0
		end	
	end

	def play
		puts "What do you want to play?"
		puts "(H)igh five, (T)ug of war, (B)all"
		@input = gets.chomp
		if @input == "h"
			puts "You give #{$name} a high five!"
			@happy = @happy + 1
		elsif @input == "t"
			puts "You play tug of war with #{$name}!"
			@happy = @happy + 1
		elsif @input == "b"
			puts "You throw a ball for #{$name}!"
			@happy = @happy + 1
		end
	end
end

playing = true
pet = Dog.new
while playing == true

	puts "
	"
	if $justChecking == false
		pet.death
		pet.needToilet
		pet.needSleep
		pet.mood
		pet.limits
		pet.death
	end
	
	$justChecking = false

	puts "-------------------"
	puts "
	"
	puts "What will you do?"
	puts "
	"
	linewidth = 50
	puts "(f)eed, (t)oilet, (s)leep, (w)alk, (c)heck, (p)lay (return) to wait,
	or (q)uit the game.".center(linewidth)
	input = gets.chomp
	puts "
	"
	puts "-------------------"
	puts "
	"

	if input == "f"
		pet.feed	
	elsif input == "t"
		pet.relieve
	elsif input == "s"
		pet.sleep
	elsif input == "w"
		pet.walk
	elsif input == "c"
		pet.check
	elsif input == "p"
		pet.play			
	elsif input == "q"
		"Finished"
		playing = false
	else
		pet.wait
	end

end