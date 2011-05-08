class Task < ActiveRecord::Base
  cattr_reader :task_types

  has_many :task_components, :dependent => :destroy
  has_many :components, :through => :task_components
  has_many :subtasks, :dependent => :destroy, :order => :position

  validates_presence_of :title
  validate :valid_task_type?

  @@task_types = %w(walkthrough step)
  @@task_types_that_can_have_subtasks = %w(walkthrough)
  @@task_types_that_can_have_components = %w(step)

  self.reflect_on_all_associations(:has_many).each do |association|
    self.class_eval %Q{
      def can_have_#{association.name.to_s}?
        @@task_types_that_can_have_#{association.name.to_s}.include?(task_type)
      end
    }
  end

  def self.all(task_type = nil)
    if task_type.blank?
      super
    else
      self.find_all_by_task_type(task_type.singularize)
    end
  end

  def possible_subtasks
    possible_subtasks = Array.new

    self.class.all.each do |task|
      unless task == self
        unless task.task_type == self.task_type # TODO replace with actual subtask rules
          unless self.subtasks.collect {|subtask| subtask.task}.include?(task)
            possible_subtasks.push(task)
          end
        end
      end
    end

    possible_subtasks
  end

  private

  def valid_task_type?
    unless @@task_types.include?(task_type)
      errors.add(:task_type, "Invalid task type. Please use one of the following ${@@task_types.to_s}")
    end
  end
end
