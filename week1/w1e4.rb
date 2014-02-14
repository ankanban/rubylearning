def is_leap(year)
	if (year % 400) == 0
		return true
	elsif (year % 100) == 0
		return false
	elsif (year % 4) == 0
		return true
	end
	return false
end

def how_many_minutes(year)
	return 60.0 * 24 * (is_leap(year) ? 366 : 365)
end

puts how_many_minutes(2014)
puts (60 * 24 * 366)
