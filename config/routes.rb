PaalWebApp::Application.routes.draw do
  resources "tasks" do
    resources "components"
    resources "subtasks", :only => [:create, :update, :destroy]
    resources "task_components", :only => [:create, :update, :destroy]

    collection do
      get "/:task_type(.:format)" => "tasks#index", :constraints => {:task_type => /#{Task.task_types.join("|")}/}
    end
  end

  resources "components"

  root :to => "tasks#index"
end
