class TasksController < ApplicationController
  def index
    @task = Task.all
  end

  def details
    @task = nil

    if params[:query].present?
      @task = Task.find_by(tittle: params[:query])
    end
  end
  # GET /tasks/new
  def new
    @task = Task.new
  end
  def edit
    @task = Task.find(params[:id])
  end
  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      redirect_to tasks_path, notice: "Task updated successfully."
    else
      render :edit
    end
  end
  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path
  end
  def create
    @task= Task.new(task_params)
    if @task.save
      flash[:notice] = "Task successfully created!"
      redirect_to tasks_path
    else
      flash[:alert] = "Task not created!"
      render :new
    end
  end


  private
    # Only allow a list of trusted parameters through.
    def task_params
      params.require(:task).permit(:tittle, :description, :status, :priority,  :user_id)
    end
end
