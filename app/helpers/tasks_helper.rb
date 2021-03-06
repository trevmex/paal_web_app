module TasksHelper
  def submit_default_value(task)
    key = task ? (task.persisted? ? :update : :create) : :submit
    task_type = ((task && task.task_type) ? task.task_type : I18n.t(:task)).capitalize

    I18n.t(:"helpers.submit.task.#{key}", :task_type => task_type)
  end
end
