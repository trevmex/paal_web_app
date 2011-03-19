PaalWebApp::Application.routes.draw do
  resources "tasks" do
    resources "components"
  end

  root :to => "tasks#index"
end
