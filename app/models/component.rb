class Component < ActiveRecord::Base
  cattr_reader :component_types

  has_many :task_components, :dependent => :destroy
  has_many :tasks, :through => :task_components

  validates_presence_of :content
  validate :valid_component_type?

  @@component_types = %w(audio image)

  private

  def valid_component_type?
    unless @@component_types.include?(component_type)
      errors.add(:component_type, "Invalid component type. Please use one of the following ${@@component_types}")
    end
  end
end
