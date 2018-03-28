class ActionsActionsController < AuthenticateController
  before_action :set_actions_action, only: [:show, :edit, :update, :destroy]

  # GET /actions_actions
  # GET /actions_actions.json
  def index
    actionSearch = params[:action_id]
    @actions_actions = ActionsAction.search(actionSearch)
  end

  # GET /actions_actions/1
  # GET /actions_actions/1.json
  def show
  end

  # GET /actions_actions/new
  def new
    @actions_action = ActionsAction.new
  end

  # GET /actions_actions/1/edit
  def edit
  end

  # POST /actions_actions
  # POST /actions_actions.json
  def create
    @actions_action = ActionsAction.new(actions_action_params)

    respond_to do |format|
      if @actions_action.save
        format.html { redirect_to @actions_action, notice: 'Le lien entre actions a été créé.' }
        format.json { render :show, status: :created, location: @actions_action }
      else
        format.html { render :new }
        format.json { render json: @actions_action.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /actions_actions/1
  # PATCH/PUT /actions_actions/1.json
  def update
    respond_to do |format|
      if @actions_action.update(actions_action_params)
        format.html { redirect_to @actions_action, notice: 'Le lien entre actions a été mis à jour.' }
        format.json { render :show, status: :ok, location: @actions_action }
      else
        format.html { render :edit }
        format.json { render json: @actions_action.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /actions_actions/1
  # DELETE /actions_actions/1.json
  def destroy
    @actions_action.destroy
    respond_to do |format|
      format.html { redirect_to actions_actions_url, notice: 'Le lien entre actions a été supprimé.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_actions_action
      @actions_action = ActionsAction.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def actions_action_params
      params.require(:actions_action).permit(:ref_id, :dep_id)
    end
end
