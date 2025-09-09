class CategoriesTasksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_category_task, only: [ :show, :edit, :update, :destroy ]

  def index
    @category_tasks = current_user.category_tasks
  end

  def show
  end

  def new
    @category_task = CategoryTask.new
    @categories = current_user.categories
    @tasks = current_user.tasks
  end

  def create
    @category_task = current_user.category_tasks.new(category_task_params)
    if @category_task.save
      redirect_to @category_task
    else
      @categories = current_user.categories
      @tasks = current_user.tasks
      render :new, status: :unprocessable_content
    end
  end

  def edit
  end

  def update
    if @category_task.update(category_task_params)
      redirect_to @category_task, status: :see_other
    else
      @categories = current_user.categories
      @tasks = current_user.tasks
      render :edit, status: :unprocessable_content
    end
  end

  def destroy
    @category_task.destroy
    redirect_to category_tasks_path, status: :see_other
  end

  private
  def set_category_task
    @category_task = current_user.category_tasks.find(params[:id])
  end

  def category_task_params
    params.require(:category_task).permit(:category_id, :task_id)
  end
end
