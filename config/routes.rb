Rails.application.routes.draw do
  root to: redirect('/tables')

  resources :users, only: %i[new create]
  resource :session, only: %i[new create destroy]
  get '/tables', to: 'tables#index'

  resources :actions, path: '/tables/actions' do
    get :autocomplete_action_title, :on => :collection
    get :autocomplete_action_picture, :on => :collection
  end

  resources :types, path: '/tables/types' do
    get :autocomplete_type_title, :on => :collection
  end

  resources :themes, path: '/tables/themes' do
    get :autocomplete_theme_title, :on => :collection
    get :autocomplete_theme_picture, :on => :collection
  end

  resources :categories, path: '/tables/categories'
  resources :costs, path: '/tables/costs'
  resources :tasks, path: '/tables/tasks'
  resources :links, path: '/tables/links'
  resources :pictures, path: '/tables/pictures'
  resources :periods, path: '/tables/periods'
  resources :actions_actions, path: '/tables/actionsActions'
  resources :tasks_tasks, path: '/tables/tasksTasks'

  # Default route (if unknown url)
  match '*path' => redirect('/tables'), via: [:get, :post]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
