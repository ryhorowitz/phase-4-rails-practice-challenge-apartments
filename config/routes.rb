Rails.application.routes.draw do
  resources :apartments, only: %i[index show create update destroy]
  resources :tenants, only: %i[index show create update destroy]
  resources :leases, only: %i[create destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
