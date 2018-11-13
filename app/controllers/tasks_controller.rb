class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  def index
    @tasks = Task.all
    @tasks.each do |task|
      puts task.title
    end
  end

  def show

  end

  def new
    @task = Task.new
  end

  def create
    # @task = Task.new(params[:task])

    @task = Task.new(task_params)
    @task.id = false
    # Need to define a private method to permit every params for security
    @task.save
    redirect_to task_path(@task.id)
  end

  def edit

  end

  def update
    @task.update(task_params)
    @task.save
    redirect_to task_path(@task)
  end

  def destroy
    @task.destroy
    redirect_to tasks_path
  end

  private

  def task_params
    # byebug
    params.require(:task).permit(:title, :details, :completed)
  end

  def set_task
    @task = Task.find(params[:id])
  end
end
