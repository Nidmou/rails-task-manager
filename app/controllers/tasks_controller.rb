class TasksController < ApplicationController
  before_action :set_task, only:[:show, :edit,:update, :destroy]
  def index
    @tasks = Task.all
  end

  def show
  end

  def new
    @tasks = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.save

    redirect_to task_path(@task)
  end

  def edit
  end

  def update

    @task.update(task_params)

    redirect_to task_path(@task)
  end

  def destroy

    @tasks.destroy

    redirect_to tasks_path, status: :see_other
  end
end


private

def task_params
  params.require(:task).permit(:title, :details, :completed)
end

def set_task
  @tasks = Task.find(params[:id])
end
