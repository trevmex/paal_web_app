class AddMediaToComponent < ActiveRecord::Migration
  def self.up
    add_column :components, :media_file_name, :string
    add_column :components, :media_content_type, :string
    add_column :components, :media_file_size, :integer
    add_column :components, :media_updated_at, :datetime
  end

  def self.down
    remove_column :components, :media_updated_at
    remove_column :components, :media_file_size
    remove_column :components, :media_content_type
    remove_column :components, :media_file_name
  end
end
