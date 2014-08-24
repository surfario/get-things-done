class TasksController < ApplicationController
  before_action :set_task_list
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = Task.all
  end

  def show    
  end

  def new
    @task = Task.new
  end

  def create
    @task = @task_list.tasks.build(task_params)
    if @task.save
      flash[:notice] = "Task was saved."
      redirect_to [@task_list]
    else
      flash[:error] = "There was an error saving the task.  Please try again."
      render :new  
    end
  end    

  def edit
  end

   def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to @task_list }
      format.json { head :no_content }
    end
  end

  def update
    if params[:completed]
      @task.update_attribute(:complete, true)
      flash[:notice] = "Congrats!"
    else
      if @task.update_attributes(task_params)
        flash[:notice] = "Your task was updated"
      else
        flash[:error] = "There was an error updating your task"
      end
    end

    redirect_to @task_list
  end

  private

  def task_params
    params.require(:task).permit(:title, :body, :complete, :due_date)
  end

  def set_task_list
    @task_list = TaskList.find(params[:task_list_id])
  end

  def set_task
    @task = @task_list.tasks.find(params[:id])
  end


end
