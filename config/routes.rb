SimpleApp::Application.routes.draw do

  get "main/index"

  resources :posts do
    resources :comments
  end

  root :to => 'main#index'

end
