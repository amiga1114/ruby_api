require 'forecast_io'
require 'geocoder'

ForecastIO.configure do |configuration|
  configuration.api_key = '607e1907086bb5969d726dff2bdc44e1'
end

def f_to_c(f)
  f = f.to_f
  ((f - 32) * 5 / 9).round(2)
end

print '어디가 궁금하세요? : '
input = gets.chomp

loCord = Geocoder.coordinates(input)
forecast = ForecastIO.forecast(loCord.first, loCord.last)
f = forecast.currently

puts f.summary
puts f_to_c f.temperature
