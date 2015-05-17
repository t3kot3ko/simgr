class Sim < ActiveRecord::Base
	belongs_to :user
	has_one :device

	def find_by_user(user)
		
	end

	def attached_device
		if Device.exists?(sim: self)
			return Device.find_by(sim: self)
		end

		return nil
	end
end
