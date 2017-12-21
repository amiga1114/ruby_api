require 'open-uri'
require 'json'

url = 'http://www.nlotto.co.kr/common.do?method=getLottoNumber&drwNo='
page = open(url).read
info = JSON.parse(page)

# 1. 현재 info hash에 있는 값을 잘 해서 아래에 넣는다.
# lucky_numbers = ['drwtNo1', 'drwtNo2', 'drwtNo3', 'drwtNo4', 'drwtNo5', 'drwtNo6']
lucky_numbers = [] # Array.new
info.each do |key, value|
  lucky_numbers << value if key.include?('drwtNo')
end
lucky_numbers.sort!
bonus_number = info['bnusNo']
my_numbers = [*1..45].sample(6).sort

# 2. 위에 두 자료를 기반으로 우리가 뽑은 번호와 비교
match_numbers = lucky_numbers & my_numbers
match_count = match_numbers.count

p my_numbers
p lucky_numbers
p match_numbers

if match_count == 6 then puts '1등'
elsif match_count == 5 && my_numbers.include?(bonus_number) then puts '2등'
elsif match_count == 5 then puts '3등'
elsif match_count == 4 then puts '4등'
elsif match_count == 3 then puts '5등'
else puts '꽝'
end
