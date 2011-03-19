class Task < ActiveRecord::Base
  cattr_reader :task_types

  has_many :task_components, :dependent => :destroy
  has_many :components, :through => :task_components
  has_many :subtasks, :dependent => :destroy

  validates_presence_of :title
  validate :valid_task_type?

  @@task_types = %w(walkthrough step choice schedule check)

  private

  def valid_task_type?
    unless @@task_types.include?(task_type)
      errors.add(:task_type, "Invalid task type. Please use one of the following ${@@task_types.to_s}")
    end
  end
end
