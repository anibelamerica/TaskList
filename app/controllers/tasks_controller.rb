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
    task_id = params[:id].to_i
    @task = Task.find_by(id: task_id)
    if @task.nil?
      head :not_found
    end
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(
      action: params[:task][:action],
      description: params[:task][:description],
      completion_date: Date.parse(params[:task][:completion_date])
    )

    if @task.save
      redirect_to root_path
    else
      render :new
    end

  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    # raise params.inspect
    @task = Task.find(params[:id])
    @task.update(
      action: params[:task][:action],
      description: params[:task][:description],
      completion_date: Date.parse(params[:task][:completion_date])
    )

    redirect_to task_path(@task.id)
  end

end
