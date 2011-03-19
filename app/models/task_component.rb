class TaskComponent < ActiveRecord::Base
  belongs_to :task
  belongs_to :component

  validates_presence_of :task_id, :component_id
end
