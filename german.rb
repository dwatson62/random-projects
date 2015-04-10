def germanNumber(input) 
   numStr = "" 
   
# Put the German for all digits and tens into arrays

   germanDigits = ["null", "ein", "zwei", "drei", "vier", "funf", "sechs", "seiben", "acht", "neun", "zehn", "elf", "zwolf"] 
   germanTens = ["zehn", "zwanzig", "dreizig", "vierzig", "funfzig", "sechszig", "seibenzig", "achtzig", "neunzig"]

# Checks the input is in the range 0 - 999
   
   if input < 0 || input > 999
   	puts "Please enter a number between zero and 999."
      return
   end

# Checks for zero

   if input == 0
      puts "null"
      return
   end
 
# Stores the digits of a number as the hundreds (1), tens (2) and digits (3) eg. 123

   hundreds = input/100 
   tens = (input - (hundreds * 100)) / 10
   digit = (input % 100) % 10

   # For easy numbers 1 - 12

   if input < 13
      numStr = germanDigits[input]
      puts numStr
      return
   end

   # For numbers between 13 - 99 and divisible by 10

   if hundreds == 0 && tens > 1 && digit == 0
      numStr = germanTens[(tens - 1)]
      puts numStr
      return

   # For numbers between 13 - 19
   # For example, in German, 15 is written as five ten

   elsif hundreds == 0 && tens == 1 && digit > 0
      numStr = germanDigits[digit] + " " + germanTens[(tens - 1)]
      puts numStr
      return

   # For all other numbers between 21 - 99

   elsif hundreds == 0 && tens > 1 && digit > 0
      numStr = germanDigits[digit] + " und " + germanTens[(tens - 1)]
      puts numStr
      return         
   
   # For numbers between 101 - 109, 202 - 209 etc.
 
   elsif hundreds > 0 && tens == 0 && digit > 0
      numStr = germanDigits[hundreds] + " hundert und " + germanDigits[digit]
      puts numStr
      return

   # For numbers multiple of 100

   elsif hundreds > 0 && tens == 0 && digit == 0
      numStr = germanDigits[hundreds] + " hundert"
      puts numStr
      return
   
      # For numbers over 100, divisible by 10 but not divisible by 100
   
   elsif hundreds > 0 && tens > 0 && digit == 0
      numStr = germanDigits[hundreds] + " hundert und " + germanTens[(tens - 1)]
      puts numStr
      return

      # For numbers between 120 - 999 which have 2 or more in the tens column
      # In German, 124 for example would be said: One hundred, four and twenty

   elsif hundreds > 0 && tens > 1 && digit > 0
      numStr = germanDigits[hundreds] + " hundert, " + germanDigits[digit] + " und " + germanTens[(tens - 1)]
      puts numStr
      return
   
      # For numbers between 110 - 999 with 1 in the tens column
      # In German, 110 for example would be said: One hundred, four ten (no and!)

   elsif hundreds > 0 && tens == 1 && digit > 0
      numStr = germanDigits[hundreds] + " hundert, " + germanDigits[digit] + " " + germanTens[(tens - 1)]
      puts numStr
      return         
   end

end

looping = true

while looping == true
   puts "Enter number or enter (q) to quit"
   input = gets.chomp
   if input == "q"
      looping = false
   else
      input = input.to_i
      germanNumber(input)
   end
end