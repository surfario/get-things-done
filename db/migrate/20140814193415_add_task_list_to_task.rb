class AddTaskListToTask < ActiveRecord::Migration
  def change
    add_column :tasks, :task_list_id, :integer
    add_index :tasks, :task_list_id
  end
end