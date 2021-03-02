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
    @new_task = Task.new(task_params)
    @new_task.save

    redirect_to root_path(@new_task.id)
  end

  def edit #mostrare form
    @task = Task.find(params[:id])
  end

  def update #patch request
     @task = Task.find(params[:id])
     @task.update(task_params)

     redirect_to root_path(@task.id)
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy

    redirect_to :root
  end


  private

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end

end
