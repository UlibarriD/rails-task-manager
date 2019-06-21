class TasksController < ApplicationController

  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @new_task = Task.new(allowed_params)
    @new_task.save
    redirect_to tasks_path
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(allowed_params)
    redirect_to tasks_path
  end

  def destroy
    deleted_task = Task.find(params[:id])
    deleted_task.destroy
    redirect_to '/tasks'
  end

  private

  def allowed_params
    params.require(:task).permit(:title, :details, :completed)
  end
end
