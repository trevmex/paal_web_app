class CreateTasks < ActiveRecord::Migration
  def self.up
    create_table :tasks do |t|
      t.string :title
      t.string :task_type

      t.timestamps
    end
  end

  def self.down
    drop_table :tasks
  end
end
