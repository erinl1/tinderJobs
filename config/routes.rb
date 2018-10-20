Rails.application.routes.draw do
  resources :users
  resources :companies do
    resources :jobs
  end
  root to: 'users#splash'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
