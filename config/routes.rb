PaalWebApp::Application.routes.draw do
  resources "tasks" do
    resources "components"
    resources "subtasks", :only => [:create, :update, :destroy]
    resources "task_components", :only => [:create, :update, :destroy]
  end

  get "/:task_type(.:format)" => "tasks#index", :constraints => {:task_type => /#{Task.task_types.collect {|task_type| task_type.pluralize}.join("|")}/}

  resources "components"

  root :to => "tasks#index"
end
