class UsersController < ApplicationController
	# for debug purpose, current user's data is shown
	def current
		render plain: current_user.inspect and return
	end

	def index
		render plain: "User#index" and return
	end
end
