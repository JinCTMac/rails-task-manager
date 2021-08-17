class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    # we need to find the task to show it by id
    @task = Task.find(params[:id])
    # raise
    # to see what is inside the value of params, which id is
  end

  def new
    @task = Task.new
    # then in the respective view, we use the helper form_for to make the form
  end

  def create
    @task = Task.new(tasks_params)
    @task.save

    # this takes us to the task show page
    redirect_to task_path(@task)
  end

  def edit
    # need to find the task to show it by id again
    @task = Task.find(params[:id])
  end

  private

  # we need strong params to save the data in the db
  # this tasks_params method is needed to bypass the forbidden attributes error
  # because it is a security method to prevent users from updating the form
  # and use malicious code in the params
  # we can replace params[:task] in create, etc
  # with this method call to bypass the security
  def tasks_params
    params.require(:task).permit(:title, :details, :completed)
  end
end
