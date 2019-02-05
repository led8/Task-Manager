class TasksController < ApplicationController
  before_action :set_task, only: %i[show update destroy]

  def index
    @tasks = policy_scope(Task).includes(:user)
    @task = Task.new
  end

  def show
  end

  def create
    @task = Task.new(task_params)
    @task.user = current_user
    authorize @task

    ajaxified_task
  end

  def update
    @task.update(task_params)
    @task.user = current_user

    ajaxified_task
  end

  def destroy
    @task.destroy
    redirect_to tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:title, :content, :progress)
  end

  def set_task
    @task = Task.find(params[:id])
    authorize @task
  end

  def ajaxified_task
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
end
