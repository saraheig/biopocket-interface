class SpeciesActionsController < AuthenticateController
  before_action :set_species_action, only: [:show, :edit, :update, :destroy]

  # GET /species_actions
  # GET /species_actions.json
  def index
    actionSearch = params[:action_id]
    speciesSearch = params[:species_id]
    @species_actions = SpeciesAction.search(actionSearch, speciesSearch)
  end

  # GET /species_actions/1
  # GET /species_actions/1.json
  def show
  end

  # GET /species_actions/new
  def new
    @species_action = SpeciesAction.new
  end

  # GET /species_actions/1/edit
  def edit
  end

  # POST /species_actions
  # POST /species_actions.json
  def create
    @species_action = SpeciesAction.new(species_action_params)

    respond_to do |format|
      if @species_action.save
        format.html { redirect_to @species_action, notice: 'Le lien entre l\'action et l\'espèce a été créé.' }
        format.json { render :show, status: :created, location: @species_action }
      else
        format.html { render :new }
        format.json { render json: @species_action.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /species_actions/1
  # PATCH/PUT /species_actions/1.json
  def update
    respond_to do |format|
      if @species_action.update(species_action_params)
        format.html { redirect_to @species_action, notice: 'Le lien entre l\'action et l\'espèce a été mis à jour.' }
        format.json { render :show, status: :ok, location: @species_action }
      else
        format.html { render :edit }
        format.json { render json: @species_action.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /species_actions/1
  # DELETE /species_actions/1.json
  def destroy
    @species_action.destroy
    respond_to do |format|
      format.html { redirect_to species_actions_url, notice: 'Le lien entre l\'action et l\'espèce a été supprimé.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_species_action
      @species_action = SpeciesAction.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def species_action_params
      params.require(:species_action).permit(:action_id, :species_id)
    end
end
