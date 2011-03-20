PaalWebApp::Application.routes.draw do
  resources "tasks" do
    resources "components"
    resources "subtasks", :only => [:create, :update, :destroy]
  end

  resources "components"

  root :to => "tasks#index"
end
