def is_leap(year)
	return ((year % 400) == 0) ? true : ((year % 100) == 0) ? false : ((year % 4) == 0) ? true : false
end

def how_old(seconds)
	# Iterate back through the years, and
	# for each year, reduce days appropriately,
	# checking if it is a leap year.
	num_days = seconds / (60 * 60 * 24.0)
	year = Time.now.year
	days_left = num_days
	age_in_years = 0

	# Calculate the no. of years, accounting for leap years.
	while days_left >= 0
		rem_days = days_left
		days_in_yr = (is_leap(year) ? 366 : 365)
		days_left -= days_in_yr
		if days_left >= 0
			age_in_years += 1
		end
		year -= 1
	end

	# now calculate no. of months, accounting for leap year month size
	year = Time.now.year
	month_count = 1
	age_in_months = 0
	days_left = rem_days

	while days_left >= 0
		rem_days = days_left
		days_in_month = (month_count == 2) ? (is_leap(year) ? 29 : 28) : (month_count % 2 == 0 ? 30 : 31)
		days_left -= days_in_month 
		if days_left >= 0
			age_in_months += 1
		end
		month_count += 1
	end

	return "You are #{age_in_years} years, #{age_in_months} months and %.2f days old." % rem_days
end


ages = [979000000, 2158493738, 246144023, 1270166272, 1025600095, 525600*60+60*24*60*31+60*60*24*29]

ages.each { |age_in_seconds| puts "#{age_in_seconds} sec = %s" % how_old(age_in_seconds) }
