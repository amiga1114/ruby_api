require 'forecast_io'

ForecastIO.configure do |configuration|
  configuration.api_key = '607e1907086bb5969d726dff2bdc44e1'
end


forecast = ForecastIO.forecast(37.501503, 127.039660)
f = forecast.currently

def f_to_c(f)
  f = f.to_f
  ((f - 32) * 5 / 9).round(2)
end

puts f.summary
puts f_to_c f.temperature
