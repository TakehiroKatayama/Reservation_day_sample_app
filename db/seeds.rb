10.times do |i|
  date = Date.today + i
  Day.create(start_time: date)
end
puts '初期データ挿入'
