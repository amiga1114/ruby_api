require 'stock_quote'
require 'eu_central_bank'

@bank = EuCentralBank.new

def usd_to_krw(volume)
  @bank.update_rates
  rate = @bank.exchange(100, 'USD', 'KRW').to_f
  result = (rate * volume.to_f).round 1
end

ARGV.each do |company|
  # company.chomp!
  stock = StockQuote::Stock.quote(company)
  puts "#{stock.name}의 가격은 #{stock.l} (₩ #{usd_to_krw(stock.l)})"
end



__END__
AAPL
FB
TSLA
GOOGL
AMZN
