class DevicesController < ApplicationController
  before_action :set_device, only: [:show, :edit, :update, :destroy, :detach_sim]
	before_filter :authenticate_user!
	before_filter :set_sims_options, only: [:new, :edit]

  # GET /devices
  def index
		@devices = Device.where(user_id: current_user.id)
  end

  # GET /devices/1
  def show
  end

  # GET /devices/new
  def new
    @device = Device.new
  end

  # GET /devices/1/edit
  def edit
		sims = Sim.where(user_id: current_user.id)
  end

  # POST /devices
	def create
		@device = Device.new(device_params)
		@device.user_id = current_user.id

		if @device.save
			redirect_to @device, notice: 'Device was successfully created.'
		else
			render :new
		end
	end

	# PATCH/PUT /devices/1
	def update
		if @device.update(device_params)
			redirect_to @device, notice: 'Device was successfully updated.' 
		else
			render :edit 
		end
	end

  # DELETE /devices/1
  def destroy
		@device.destroy
		redirect_to devices_url, notice: 'Device was successfully destroyed.'
  end

	# PUT /devices/1
	def detach_sim
		@device.update(sim: nil)
		
		# back to previous location
		redirect_to Rails.application.routes.recognize_path(request.referer)
	end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_device
      device = Device.find(params[:id])
			unless device.user_id == current_user.id
				redirect_to devices_url, alert: "Not your device" and return
			end

			@device = device

    end

		def set_sims_options
			sims = Sim.where(user_id: current_user.id)
			options = sims.map do |sim|
				if sim == @device.sim
					["#{sim.number} (attached)"]
				else
					[sim.number, sim.id]
				end
			end

			@sims_options = options + [["(detached)", nil]]
		end

    # Never trust parameters from the scary internet, only allow the white list through.
    def device_params
      params.require(:device).permit(:sim_id, :model_number, :name, :imei, :description)
    end
end
