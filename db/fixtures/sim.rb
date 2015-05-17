5.times do |i|
	Sim.seed_once do |s|
		s.id = i
		s.carrior = ["docomo", "au", "softbank"][i % 3]
		s.number = "0#{[9, 8][i % 2].to_s}0-#{i.to_s * 4}-#{i.to_s * 4}"
		s.available = true
		s.registered_at = "2010-01-23"
		s.imsi = i.to_s * 13
		s.user_id = 1
	end
end
