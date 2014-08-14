class Task < ActiveRecord::Base
  belongs_to :task_list
  def days_remaining
    #days_remaining = due date - today's date, rounded to days
  end  
end
