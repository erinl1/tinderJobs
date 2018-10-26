Rails.application.routes.draw do
  resources :users do
    get :match
  end
  get '/users/:id/match', to: 'users#match'

  resources :companies do
    resources :jobs do
      get :match
    end
  end

  root to: 'users#splash'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
