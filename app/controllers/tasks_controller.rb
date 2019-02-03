class TasksController < ApplicationController
  def index
    @tasks = policy_scope(Task)
  end

  def show
    @task = Task.find(params[:id])
    authorize @task
  end
end
