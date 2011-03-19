class CreateSubtasks < ActiveRecord::Migration
  def self.up
    create_table :subtasks do |t|
      t.integer :task_id
      t.integer :subtask_id
      t.integer :position

      t.timestamps
    end
  end

  def self.down
    drop_table :subtasks
  end
end
