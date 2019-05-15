require 'pry'
require 'date'


class Weather::CLI

  def  call #just puts today's weatehr
    puts "Today's Weather"
  end     #def

  def    cli_input # asks the user for the day they'd like weather for
   puts "What day would you like the weather for? (use three letter initial Mon, Tue, etc.)"
   input = gets.strip
   weather_by_day(input)
  end     #def

  def   weather_by_day(input) #puts out the answer string
    puts "The weather on #{input} will be #{find_day(input).cond}"
  end     #def

  def    find_day(day_string)
     Days_weather.all.find do |date|
       date.day == day_string
     end
  end     #def

end
