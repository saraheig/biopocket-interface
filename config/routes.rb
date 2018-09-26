Rails.application.routes.draw do
  root to: redirect('/tables')

  resource :session, only: [:new, :create, :destroy]
  get '/tables', to: 'tables#index'

  resources :actions, path: '/tables/actions' do
    get :autocomplete_action_title, :on => :collection
    get :autocomplete_action_code, :on => :collection
  end

  resources :types, path: '/tables/types' do
    get :autocomplete_type_title, :on => :collection
  end

  resources :themes, path: '/tables/themes' do
    get :autocomplete_theme_title, :on => :collection
    get :autocomplete_theme_code, :on => :collection
  end

  resources :costs, path: '/tables/costs' do
    get :autocomplete_cost_title, :on => :collection
    get :autocomplete_cost_unit, :on => :collection
  end

  resources :species, path: '/tables/species' do
    get :autocomplete_species_common_name, :on => :collection
    get :autocomplete_species_latin_name, :on => :collection
  end

  resources :tasks, path: '/tables/tasks' do
    get :autocomplete_task_title, :on => :collection
    get :autocomplete_task_code, :on => :collection
  end

  resources :constraints, path: '/tables/constraints' do
    get :autocomplete_constraint_title, :on => :collection
  end

  resources :links, path: '/tables/links' do
    get :autocomplete_link_link, :on => :collection
  end

  resources :pictures, path: '/tables/pictures' do
    get :autocomplete_picture_source, :on => :collection
  end

  resources :categories, path: '/tables/categories' do
    get :autocomplete_category_title, :on => :collection
  end

  resources :units, path: '/tables/units' do
    get :autocomplete_unit_abbreviation, :on => :collection
    get :autocomplete_unit_name, :on => :collection
  end

  resources :periods, path: '/tables/periods'
  resources :actions_actions, path: '/tables/actionsActions'
  resources :tasks_tasks, path: '/tables/tasksTasks'
  resources :species_actions, path: '/tables/speciesActions'

  # Default route (if unknown url)
  match '*path' => redirect('/tables'), via: [:get, :post]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
