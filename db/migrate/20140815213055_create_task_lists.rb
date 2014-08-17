class CreateTaskLists < ActiveRecord::Migration
  def change
    create_table :task_lists do |t|
      t.string :name
      t.references :user, index: true

      t.timestamps
    end
  end
end