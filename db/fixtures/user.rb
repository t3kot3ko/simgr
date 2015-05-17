5.times do |i|
	User.seed_once do |u|
		u.id = i
		u.email = "test#{i}@example.com"
		u.password = "12345678"
	end
end
