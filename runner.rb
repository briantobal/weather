
require './lib/weather.rb'
require 'nokogiri'   #gem install nokogiri
require 'open-uri'
doc = Nokogiri::HTML(open("https://weather.com/weather/tenday/l/New+York+NY+10012:4:US"))

weather_instance = Weather::CLI.new
Days_weather.parser(doc)
weather_instance.cli_input
