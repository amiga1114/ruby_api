require 'stock_quote'

DATA.each do |company|
  company.chomp!
  stock = StockQuote::Stock.quote(company)
  puts stock.name
  puts stock.l
end

# __END__아래는 전부 DATA로 처리
__END__
AAPL
FB
TSLA
GOOGL
AMZN
