class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
    @task_list = TaskList.find(params[:task_list_id])
  end

  def new
    @task_list = TaskList.find(params[:task_list_id])
    @task = Task.new
  end

  def create
    @task_list = TaskList.find(params[:task_list_id])
    @task = @task_list.tasks.build(params.require(:task).permit(:title, :body, :complete, :due_date))
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
end
