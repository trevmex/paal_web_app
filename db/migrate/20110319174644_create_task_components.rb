class CreateTaskComponents < ActiveRecord::Migration
  def self.up
    create_table :task_components do |t|
      t.integer :task_id
      t.integer :component_id

      t.timestamps
    end
  end

  def self.down
    drop_table :task_components
  end
end
