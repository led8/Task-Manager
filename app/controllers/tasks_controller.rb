class TasksController < ApplicationController
  def index
    @tasks = policy_scope(Task).includes(:user)
    @task = Task.new
  end

  def show
    @task = Task.find(params[:id])
    authorize @task
  end

  def create
    @task = Task.new(task_params)
    @task.user = current_user
    authorize @task

    if @task.save
      respond_to do |format|
        format.html { redirect_to tasks_path }
        format.js
      end
    else
      respond_to do |format|
        format.html { redirect_to(root_path) }
        format.js
      end
    end
  end

  private

  def task_params
    params.require(:task).permit(:title, :content, :progress)
  end
end
