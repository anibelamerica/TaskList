# TASKS = [
#   "Clean your room",
#   "Do CS Fundamentals",
#   "Meal Prep",
#   "Finish your homework"
# ]

class TasksController < ApplicationController

  def index
    @tasks = Task.all
  end

  def show
    task_id = params[:id]
    @task = Task.find_by(id: task_id)
    if @task.nil?
      head :not_found
    end
  end

  def new
    @task = Task.new
  end

  def create
    task = Task.new(
      task_params
    )

    if task.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @task = Task.find_by(id: params[:id])
  end

  def update
    # raise params.inspect
    @task = Task.find(params[:id])

    if @task.update(task_params)
      redirect_to task_path(@task.id)
    else
      render :update
    end
  end

  def destroy
    Task.find_by(id: params[:id]).destroy
    redirect_to root_path
  end

  private

  def task_params
    return params.require(:task).permit(
      :action,
      :description,
      :completion_date
    )
  end

  def complete
    Task.find_by(id: params[:id])
    redirect_to root_path

  end

end
