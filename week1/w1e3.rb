
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

def how_old(seconds)
	# Iterate back through the years, and
	# for each year, reduce days appropriately,
	# checking if it is a leap year.

	num_days = seconds / (60 * 60 * 24.0)
	year = Time.now.year
	days_left = num_days
	age = 0
	age_frac = 0
	while days_left > 0
		days_in_yr = 365
		if is_leap(year)
			days_in_yr = 366
		end
		# Force floating point division
		age_frac = days_left / days_in_yr.to_f
		days_left -= days_in_yr
		if days_left > 0
			age += 1
		end
		year -= 1
	end
	age = age + age_frac
	return age 
end

def how_old_avg(seconds)
	# Use avg. days per year
	return seconds / (60 * 60 * 24 * 365.2425)
end

def how_old_simple(seconds)
	# No leap year factoring.
	return seconds / (60 * 60 * 24 * 365.0)
end

age_in_seconds = 979000000
puts format("%.10f", how_old(age_in_seconds))
puts format("%.10f", how_old_avg(age_in_seconds))
puts format("%.10f", how_old_simple(age_in_seconds))
puts format("%.2f", how_old(age_in_seconds))
puts format("%.2f", how_old_avg(age_in_seconds))
puts format("%.2f", how_old_simple(age_in_seconds))