Rails.application.routes.draw do
  root 'pages#home'
  get 'dashboard', to: 'pages#dashboard', as: 'dashboard'
  resources :lab_sections
  resources :patients
  resources :samples
  resources :test_results do
    member do
      get :send_results
    end
    member do
      get :review_result
    end
  end
  resources :tests
  devise_for :users, controllers: { registrations: 'admin/registrations' }
devise_scope :user do
  get 'users/:id/edit', to: 'admin/registrations#edit', as: :edit_user_registration_admin
  patch 'users/:id', to: 'admin/registrations#update'
  delete 'users/:id', to: 'admin/registrations#destroy', as: :destroy_user_admin

end

  # For details on the DSL available within this file, see https://guid
end
