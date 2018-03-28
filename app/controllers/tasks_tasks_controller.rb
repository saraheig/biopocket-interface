class TasksTasksController < AuthenticateController
  before_action :set_tasks_task, only: [:show, :edit, :update, :destroy]

  # GET /tasks_tasks
  # GET /tasks_tasks.json
  def index
    taskSearch = params[:task_id]
    @tasks_tasks = TasksTask.search(taskSearch)
  end

  # GET /tasks_tasks/1
  # GET /tasks_tasks/1.json
  def show
  end

  # GET /tasks_tasks/new
  def new
    @tasks_task = TasksTask.new
  end

  # GET /tasks_tasks/1/edit
  def edit
  end

  # POST /tasks_tasks
  # POST /tasks_tasks.json
  def create
    @tasks_task = TasksTask.new(tasks_task_params)

    respond_to do |format|
      if @tasks_task.save
        format.html { redirect_to @tasks_task, notice: 'Le lien entre tâches a été créé.' }
        format.json { render :show, status: :created, location: @tasks_task }
      else
        format.html { render :new }
        format.json { render json: @tasks_task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tasks_tasks/1
  # PATCH/PUT /tasks_tasks/1.json
  def update
    respond_to do |format|
      if @tasks_task.update(tasks_task_params)
        format.html { redirect_to @tasks_task, notice: 'Le lien entre tâches a été mis à jour.' }
        format.json { render :show, status: :ok, location: @tasks_task }
      else
        format.html { render :edit }
        format.json { render json: @tasks_task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks_tasks/1
  # DELETE /tasks_tasks/1.json
  def destroy
    @tasks_task.destroy
    respond_to do |format|
      format.html { redirect_to tasks_tasks_url, notice: 'Le lien entre tâches a été supprimé.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tasks_task
      @tasks_task = TasksTask.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tasks_task_params
      params.require(:tasks_task).permit(:ref_id, :dep_id)
    end
end
