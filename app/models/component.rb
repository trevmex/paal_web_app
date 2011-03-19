class Component < ActiveRecord::Base
  has_many :task_components, :dependent => :destroy
  has_many :tasks, :through => :task_components

  validates_presence_of :content
  validate :valid_component_type?

  private

  @@component_types = %w(audio image)

  def valid_component_type?
    unless @@component_types.include?(component_type)
      errors.add(:component_type, "Invalid component type. Please use one of the following ${@@component_types}")
    end
  end
end
