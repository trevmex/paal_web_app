PaalWebApp::Application.routes.draw do
  resources "tasks" do
    resources "components"
    resources "subtasks", :only => [:create, :update, :destroy]
  end

  root :to => "tasks#index"
end
