class Task < ActiveRecord::Base
  belongs_to :task_list
  def days_remaining
    #due_date = created at + 7 days
    #day's remaining = due date - today's date 
  end  
end
