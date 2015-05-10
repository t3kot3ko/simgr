class SimsController < ApplicationController
	before_action :set_sim, only: [:show, :edit, :update, :destroy]

	# GET /sims
	def index
		@sims = Sim.all
	end

	# GET /sims/1
	def show
	end

	# GET /sims/new
	def new
		@sim = Sim.new
	end

	# GET /sims/1/edit
	def edit
	end

	# POST /sims
	def create
		@sim = Sim.new(sim_params)

		if @sim.save
			redirect_to @sim, notice: 'Sim was successfully created.'
		else
			render :new 
		end
	end

	# PATCH/PUT /sims/1
	def update
		if @sim.update(sim_params)
			redirect_to @sim, notice: 'Sim was successfully updated.'
		else
			render :edit
		end
	end

	# DELETE /sims/1
	def destroy
		@sim.destroy
		redirect_to sims_url, notice: 'Sim was successfully destroyed.'
	end

	private
	# Use callbacks to share common setup or constraints between actions.
	def set_sim
		@sim = Sim.find(params[:id])
	end

	# Never trust parameters from the scary internet, only allow the white list through.
	def sim_params
		params.require(:sim).permit(:carrior, :number, :valid, :registered_at, :imsi, :user_id)
	end
end
