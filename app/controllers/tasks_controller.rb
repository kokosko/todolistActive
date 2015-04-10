class TasksController < ApplicationController
  before_action :set_task, only: [:edit, :update, :destroy]

  # GET /tasks
  # GET /tasks.json
  def index
    @tasks = Task.rank(:row_order).all
    @task = Task.new
  end

  def update_row_order
    @task = Task.find(params['task']['task_id'])
    @task.row_order_position = params['task']['position']
    @task.save

    render nothing: true
  end

  # GET /tasks/new
  def new
    @task = Task.new
  end

  # GET /tasks/1/edit
  def edit
    @task = Task.find(params[:id])
    respond_to do |format|
        format.html { redirect_to tasks_url }
        format.js {}
    end
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = Task.new(task_params)

    respond_to do |format|
      if @task.save
        format.html { redirect_to tasks_url }
        format.js {}
      else
        format.html {}
        format.js { render :error, locals: { error_message: "Pls, write something to filed" } }
      end
    end
  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to tasks_url }
        format.js {}
      else
        format.html { render :edit }
        format.js { render :error, locals: { error_message: "Pls, write something to field" } }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    respond_to do |format|
      format.html { redirect_to tasks_url, notice: 'Task was successfully destroyed.' }
      format.js {}
    end
    @task.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(:title, :done, :id)
    end
end
