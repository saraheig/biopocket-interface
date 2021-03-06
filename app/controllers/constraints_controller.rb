class ConstraintsController < AuthenticateController
  before_action :set_constraint, only: [:show, :edit, :update, :destroy]
  autocomplete :constraint, :title, :full => true

  # GET /constraints
  # GET /constraints.json
  def index
    keyword = params[:keyword]
    task = params[:task_id]
    @constraints = Constraint.search(keyword, task)
  end

  # GET /constraints/1
  # GET /constraints/1.json
  def show
  end

  # GET /constraints/new
  def new
    @constraint = Constraint.new
  end

  # GET /constraints/1/edit
  def edit
  end

  # POST /constraints
  # POST /constraints.json
  def create
    @constraint = Constraint.new(constraint_params)

    respond_to do |format|
      if @constraint.save
        format.html { redirect_to @constraint, notice: 'La contrainte a été créée.' }
        format.json { render :show, status: :created, location: @constraint }
      else
        format.html { render :new }
        format.json { render json: @constraint.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /constraints/1
  # PATCH/PUT /constraints/1.json
  def update
    respond_to do |format|
      if @constraint.update(constraint_params)
        format.html { redirect_to @constraint, notice: 'La contrainte a été mise à jour.' }
        format.json { render :show, status: :ok, location: @constraint }
      else
        format.html { render :edit }
        format.json { render json: @constraint.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /constraints/1
  # DELETE /constraints/1.json
  def destroy
    @constraint.destroy
    respond_to do |format|
      format.html { redirect_to constraints_url, notice: 'La contrainte a été supprimée.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_constraint
      @constraint = Constraint.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def constraint_params
      params.require(:constraint).permit(:title, :description, :task_id)
    end
end
