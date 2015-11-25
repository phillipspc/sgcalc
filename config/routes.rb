Rails.application.routes.draw do
  root to: 'rounds#index'
  resources :rounds
  resources :holes do
    resources :strokes
  end
end
