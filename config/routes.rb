Rails.application.routes.draw do
  resources :rooms, only: [:index, :show] do
    resources :meets, only: [:new, :create, :show] # Agrega :show aquí
  end
  
  resources :assigns
  root "meets#index"
end
