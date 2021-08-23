2.times do |i|
  date = Date.today + i
  Day.create(reservation_date: date)
end
puts '初期データ挿入'
