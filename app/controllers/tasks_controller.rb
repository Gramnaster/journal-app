class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_task, only: [ :show, :edit, :update, :destroy ]

  def index
    @tasks = current_user.tasks.where("created_at <= ?", Time.current.end_of_day)
  end

  def show
  end

  def new
    @task = current_user.tasks.new
  end

  def create
    @task = current_user.tasks.new(task_params)

    if @task.save
      # Assign categories AFTER the task is saved
      if params[:task][:category_ids].present?
        category_ids = params[:task][:category_ids].reject(&:blank?)
        categories = current_user.categories.where(id: category_ids)

        # Clear existing associations first
        @task.category_tasks.destroy_all

        # Create new associations
        categories.each do |category|
          CategoryTask.create!(task: @task, category: category)
        end
      end

      if params[:return_to].present?
        redirect_to params[:return_to], notice: "Task was successfully created."
      else
        redirect_to @task, notice: "Task was successfully created."
      end
    else
      render :new, status: :unprocessable_content
    end
  end

  def edit
  end

  def update
    if @task.update(task_params)
      redirect_to @task, status: :see_other
    else
      render :edit, status: :unprocessable_content
    end
  end

  def destroy
    @task.destroy
    redirect_to tasks_path, status: :see_other
  end

  private
  def set_task
    @task = current_user.tasks.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :content, category_ids: [])
  end
end
