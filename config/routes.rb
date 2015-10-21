Rails.application.routes.draw do
  root to: 'rounds#index'
  resources :rounds do
    resources :holes
  end
end
