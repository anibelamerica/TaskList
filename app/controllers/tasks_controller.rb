TASKS = [
  "Clean your room",
  "Do CS Fundamentals",
  "Meal Prep"
]

class TasksController < ApplicationController

  def index
    @tasks = TASKS
  end
end
