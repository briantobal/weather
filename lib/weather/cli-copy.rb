#require 'pry'
require 'date'

class Weather::CLI
 @@weeks_weather = {
   "Mon" => {description:""},
   "Tue" => {description:""},
   "Wed" => {description:""},
   "Thu" => {description:""},
   "Fri" => {description:""},
   "Sat" => {description:""},
   "Sun" => {description:""}
 }

class Days_weather
  #creates an object instance with that days weather
  attr_accessor :name

  def  initialize (day, cond)
    @day = day
    @cond = cond
    @all_week = []
  end     #def


end

weather = Days_weather.new 


  def    todays_date #this grabs today's date as a three letter date
     today = Date.today.strftime("%a")
     return today
  end     #def

  def  call #just puts today's weatehr
    puts "Today's Weather"
  end     #def

  def    cli_input # asks the user for the day they'd like weather for
   puts "What day would you like the weather for? (use three letter initial Mon, Tue, etc.)"
   input = gets.strip
   weather_by_day(input)
  end     #def

  def   weather_by_day(input) #puts out the answer string
    puts "The weather on #{input} will be #{@@weeks_weather[input][:description]}"
  end     #def

  def    parser(html_doc) #grab all the html info
    week_day = todays_date #sets the weekday variable to today
    keys = ["Monday" , "Tuesday" , "Wednesday" , "Thursday" , "Friday" , "Saturday" ,"Sunday"]
    ind = keys.index(week_day) #sets the variable ind (index) for the day string of today
    counter = ind #puts the counter
    table_rows = html_doc.css(".twc-table").css("tr") #gives me all the tabel rows in order
      table_rows.each_with_index do |tr, index| #iterates over the tr's
         day_time = tr.css(".date-time").text #gets the date
        conditions = tr.css(".description").css("span").text #gets the condisitons
          if index == 0
            next
          end
          if index == 1
            day_time = todays_date
          end
          @@weeks_weather[day_time][:description]= conditions

          if index == 7
            break
          end
        end
  end     #def

end
