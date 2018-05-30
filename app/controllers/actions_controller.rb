class ActionsController < AuthenticateController
  before_action :set_action, only: [:show, :edit, :update, :destroy]
  autocomplete :action, :title, :full => true
  autocomplete :action, :code, :full => true
  autocomplete :action, :picture, :full => true
  autocomplete :action, :source, :full => true

  # GET /actions
  # GET /actions.json
  def index
    keyword = params[:keyword]
    spot = params[:spot]
    investment = params[:investment]
    costmin = params[:costmin]
    costmax = params[:costmax]
    surfmin = params[:surfmin]
    surfmax = params[:surfmax]
    importmin = params[:importmin]
    importmax = params[:importmax]
    theme = params[:theme_id]
    type = params[:type_id]
    @actions = Action.search(keyword, spot, investment, costmin, costmax, surfmin, surfmax, importmin, importmax, theme, type)
  end

  # GET /actions/1
  # GET /actions/1.json
  def show
  end

  # GET /actions/new
  def new
    @action = Action.new
  end

  # GET /actions/1/edit
  def edit
  end

  # POST /actions
  # POST /actions.json
  def create
    @action = Action.new(action_params)

    respond_to do |format|
      if @action.save
        format.html { redirect_to @action, notice: 'L\'action a été créée.' }
        format.json { render :index, status: :created, location: @action }
      else
        format.html { render :new }
        format.json { render json: @action.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /actions/1
  # PATCH/PUT /actions/1.json
  def update
    respond_to do |format|
      if @action.update(action_params)
        format.html { redirect_to @action, notice: 'L\'action a été mise à jour.' }
        format.json { render :index, status: :ok, location: @action }
      else
        format.html { render :edit }
        format.json { render json: @action.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /actions/1
  # DELETE /actions/1.json
  def destroy
    @action.destroy
    respond_to do |format|
      format.html { redirect_to actions_url, notice: 'L\'action a été supprimée.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_action
      @action = Action.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def action_params
      params.require(:bioaction).permit(:theme_id, :type_id, :title, :code, :description, :short_description, :impact, :spot, :cost_min, :time_min, :unit_id, :time_description, :surface_min, :investment, :picture, :load_picture, :source, :importance)
    end
end