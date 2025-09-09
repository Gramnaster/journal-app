Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: "users/registrations",
    sessions: "users/sessions"
  }

  resources :categories

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  get "/tasks" => "tasks#index"
  get "/tasks/new" => "tasks#new", as: "new_task"
  post "/tasks" => "tasks#create", as: "create_task"
  get "/tasks/:id" => "tasks#show", as: "task"
  get "/tasks/:id/edit" => "tasks#edit", as: "edit_task"
  patch "/tasks/:id" => "tasks#update", as: "update_task"
  delete "/tasks/:id" => "tasks#destroy", as: "destroy_task"

  get "/categorytasks" => "categories_tasks#index"
  get "/categorytasks/new" => "categories_tasks#new", as: "new_category_task"
  post "/categorytasks/" => "categories_tasks#create", as: "create_category_task"
  get "/categorytasks/:id" => "categories_tasks#show", as: "category_task"
  get "/categorytasks/:id/edit" => "categories_tasks#edit", as: "edit_category_task"
  patch "/categorytasks/:id" => "categories_tasks#update", as: "update_category_task"
  delete "/categorytasks/:id" => "categories_tasks#destroy", as: "destroy_category_task"

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
end
