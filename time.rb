puts "What year were you born in?"
year = gets.chomp
puts "What month were you born in?"
month = gets.chomp
puts "What day were you born on?"
day = gets.chomp

timeNow = Time.new
timeBirth = Time.mktime(year, month, day)
secondsOld = (timeNow - timeBirth).to_i
halfLife = Time.at((timeBirth + secondsOld / 2))

puts "The time is #{timeNow}"
puts "I was born on #{day}/#{month}/#{year}"
puts "I am #{secondsOld.to_i} seconds old!"
puts "And I will be 1 billion seconds old at #{(timeBirth + 1000000000)}"
puts "And the exact halfway point of my life so far was #{halfLife}"