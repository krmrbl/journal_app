class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :get_category

  def index
    @category_id = params[:category_id]
    @tasks = @category.tasks
  end

  def new
    @task = @category.tasks.build
  end

  def create
    @task = @category.tasks.build(task_data)
    if @task.save
      redirect_to category_tasks_path
    else
      render :new
    end
  end

  def show
    @task = Task.find(params[:id])
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_data)
      redirect_to category_tasks_path(@task.category_id)
    else
      render :edit
    end
  end

  def destroy
    @task = Task.find(params[:id])
    if @task.destroy
      redirect_to category_tasks_path(@task.category_id)
    else
      render :index
    end
  end

  private

  def get_category
    @category = Category.find(params[:category_id])
  end

  def task_data
    params.require(:task).permit(:category_id, :task_name, :task_body, :deadline)
  end
end
