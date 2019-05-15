
class Days_weather
  #creates an object instance with that days weather
  attr_accessor :day, :cond
  @@all = []

  def  initialize (day, cond)
    @day = day
    @cond = cond
    @@all << self
  end     #def

  def  self.all
    @@all
  end     #def

  def   self.todays_date #this grabs today's date as a three letter date
     today = Date.today.strftime("%a")
     return today
  end     #def

  def self.parser(html_doc) #grab all the html info
    week_day = self.todays_date #sets the weekday variable to today
    keys = ["Monday" , "Tuesday" , "Wednesday" , "Thursday" , "Friday" , "Saturday" ,"Sunday"]
    ind = keys.index(week_day) #sets the variable ind (index) for the day string of today
    counter = ind #puts the counter
    table_rows = html_doc.css(".twc-table").css("tr") #gives me all the tabel rows in order
      table_rows.each_with_index do |tr, index|
         day_time = tr.css(".date-time").text
        conditions = tr.css(".description").css("span").text
          if index == 0
            next
          end

          if index == 1
            day_time = todays_date
          end
          weather = Days_weather.new(day_time, conditions)

          #@@weeks_weather[day_time][:description]= conditions

          if index == 7
            break
          end

        end
  end     #def


end #class
