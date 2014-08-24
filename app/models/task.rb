class Task < ActiveRecord::Base
  belongs_to :task_list

  after_create :set_due_date, :set_complete

  scope :incomplete, -> { where("complete is NULL or complete = ?", false) }

  def due_date
    due_date = (self.created_at + 7.days).to_date
  end
    
  def days_remaining
    days_remaining = (due_date - Date.today).to_i
  end         

  private

  def set_due_date
    update_attribute(:due_date, Time.now + 7.days)
  end 

  def set_complete
    update_attribute(:complete, false)
  end  

end
