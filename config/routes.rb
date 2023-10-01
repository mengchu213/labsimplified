Rails.application.routes.draw do
  root 'pages#home'
  get 'dashboard', to: 'pages#dashboard', as: 'dashboard'
  resources :lab_sections
  resources :patients
  resources :samples
  resources :test_results do
    member do
      get :review_result
    end
  end
  resources :tests
  devise_for :users
  # For details on the DSL available within this file, see https://guid
end