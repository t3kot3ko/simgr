class Contract < ActiveRecord::Base
	belongs_to :user

	def from_sim
		return Sim.find(self.from_sim_id) rescue nil
	end

	def to_sim
		return Sim.find(self.to_sim_id) rescue nil
	end


	def kind
		from_sim_id, to_sim_id = self.from_sim_id, self.to_sim_id

		if from_sim_id && to_sim_id
			return :mnp
		elsif from_sim_id && !to_sim_id
			return :cancel
		elsif !from_sim_id && to_sim_id
			return :new
		else
			# must not be here
		end
	end

end
