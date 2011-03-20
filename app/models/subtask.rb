class Subtask < ActiveRecord::Base
  belongs_to :task
  has_one :task, :primary_key => :subtask_id, :foreign_key => :id
  acts_as_list :scope => :task

  validates_presence_of :task_id, :subtask_id
  validates_uniqueness_of :position, :scope => "task_id"
  validates_numericality_of :position
  validate :valid_subtask_id?

  private

  def valid_subtask_id?
    unless task_id != subtask_id
      errors.add(:subtask_id, "Subtask is identical to task. Do not add a task to itself.")
    end

    begin
      Task.find(subtask_id)
    rescue
      errors.add(:subtask_id, "Invalid task. Please use an existing task.")
    end
  end
end
