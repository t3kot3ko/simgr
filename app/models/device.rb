class Device < ActiveRecord::Base
	belongs_to :user
	belongs_to :sim
end
