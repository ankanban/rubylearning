
def convert(fahr)
	return (fahr - 32) * (5 / 9.0)
end

def alt_round(num)
	return (num * 100).round / 100.0
end

puts "%.2f" % convert(100)
puts alt_round(convert(100))