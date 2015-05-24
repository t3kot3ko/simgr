class ContractsController < ApplicationController
  before_action :set_contract, only: [:show, :edit, :update, :destroy]
	before_filter :authenticate_user!

  # GET /contracts
  def index
    @contracts = Contract.all
  end

  # GET /contracts/1
  def show
  end

  # GET /contracts/new
  def new
		sims = Sim.where(user_id: current_user.id)
		@from_sim_options = sims.dup.map{|sim| [sim.number, sim.id]} << ["not selected", ""]
		@to_sim_options = sims.dup.map{|sim| [sim.number, sim.id]}

    @contract = Contract.new
  end

  # GET /contracts/1/edit
  def edit
  end

  # POST /contracts
  def create
    @contract = Contract.new(contract_params)
		@contract.user = current_user

		from_sim_id, to_sim_id = @contract.from_sim_id, @contract.to_sim_id

		if @contract.save
			redirect_to @contract, notice: 'Contract was successfully created.'
		else
			render :new
		end
  end

  # PATCH/PUT /contracts/1
  def update
		if @contract.update(contract_params)
			redirect_to @contract, notice: 'Contract was successfully updated.'
		else
			render :edit
		end
  end

  # DELETE /contracts/1
  def destroy
    @contract.destroy
    redirect_to contracts_url, notice: 'Contract was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contract
      contract = Contract.find(params[:id])
			unless contract.user == current_user
				redirect_to contracts_url, alert: "Not your resource" and return
			end
			@contract = contract
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contract_params
      params.require(:contract).permit(:from_sim_id, :to_sim_id, :processed_at, :description, :user_id, :type)
    end
end
