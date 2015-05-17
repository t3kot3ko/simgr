5.times do |i|
	Device.seed_once do |d|
		d.id = i
		d.model_number = "ABCDE#{i}"
		d.name = "NAMENAME#{i}"
		d.imei = i.to_s * 10
		d.description = "description#{i}"
		d.user_id = 1
	end
end
