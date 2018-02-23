class ActionsController < AuthenticateController
  before_action :set_action, only: [:show, :edit, :update, :destroy]

  # GET /actions
  # GET /actions.json
  def index
    keyword = params[:keyword]
    house = params[:house]
    difficulty = params[:difficulty]
    costmin = params[:costmin]
    costmax = params[:costmax]
    topic = params[:topic_id]
    category = params[:category_id]
    @actions = Action.search(keyword, house, difficulty, costmin, costmax, topic, category)
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
      params.require(:action).permit(:topic_id, :category_id, :title, :description, :impact, :house, :cost, :time, :difficulty)
    end
end
