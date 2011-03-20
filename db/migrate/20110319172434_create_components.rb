class CreateComponents < ActiveRecord::Migration
  def self.up
    create_table :components do |t|
      t.text :description
      t.string :component_type

      t.timestamps
    end
  end

  def self.down
    drop_table :components
  end
end
